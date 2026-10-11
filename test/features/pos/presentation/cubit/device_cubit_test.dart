import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/device_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pos.dart';

class _MockPos extends Mock implements PosRepository;

const _network = ApiException(code: 'network', message: '');
const _notRegistered = ApiException(
  code: 'device_not_registered',
  message: '',
  statusCode: 403,
);

void main() {
  late _MockPos pos;

  setUp(() => pos = _MockPos());

  group('load', () {
    blocTest<DeviceCubit, DeviceState>(
      "is ready on one of the outlet's devices",
      setUp: () => when(() => pos.device()).thenAnswer((_) async => testTill()),
      build: () => DeviceCubit(pos),
      act: (cubit) => cubit.load(),
      expect: () => [
        const DeviceState.loading(),
        DeviceState.ready(testTill()),
      ],
    );

    for (final code in ['device_not_registered', 'device_revoked']) {
      blocTest<DeviceCubit, DeviceState>(
        'asks for activation on $code',
        setUp: () => when(() => pos.device())
            .thenThrow(ApiException(code: code, message: '', statusCode: 403)),
        build: () => DeviceCubit(pos),
        act: (cubit) => cubit.load(),
        expect: () => const [DeviceState.loading(), DeviceState.unregistered()],
      );
    }

    blocTest<DeviceCubit, DeviceState>(
      "fails when the device can't be checked",
      setUp: () => when(() => pos.device()).thenThrow(_network),
      build: () => DeviceCubit(pos),
      act: (cubit) => cubit.load(),
      expect: () => const [DeviceState.loading(), DeviceState.failed(_network)],
    );
  });

  group('refresh', () {
    blocTest<DeviceCubit, DeviceState>(
      'keeps the device when the check fails for lack of network',
      setUp: () => when(() => pos.device()).thenThrow(_network),
      build: () => DeviceCubit(pos),
      seed: () => DeviceState.ready(testTill()),
      act: (cubit) => cubit.refresh(),
      expect: () => <DeviceState>[],
    );

    blocTest<DeviceCubit, DeviceState>(
      'learns that the device is no longer registered',
      setUp: () => when(() => pos.device()).thenThrow(_notRegistered),
      build: () => DeviceCubit(pos),
      seed: () => DeviceState.ready(testTill()),
      act: (cubit) => cubit.refresh(),
      expect: () => const [DeviceState.unregistered()],
    );
  });

  group('activate', () {
    blocTest<DeviceCubit, DeviceState>(
      'activates the phone, then sells on it',
      setUp: () {
        when(() => pos.activate(any())).thenAnswer((_) async {});
        when(() => pos.device()).thenAnswer((_) async => testTill());
      },
      build: () => DeviceCubit(pos),
      seed: () => const DeviceState.unregistered(),
      act: (cubit) => cubit.activate('Kasir depan'),
      expect: () => [
        const DeviceState.unregistered(activating: true),
        DeviceState.ready(testTill()),
      ],
      verify: (_) => verify(() => pos.activate('Kasir depan')).called(1),
    );

    blocTest<DeviceCubit, DeviceState>(
      'says why an activation was refused',
      setUp: () => when(() => pos.activate(any())).thenThrow(
        const ApiException(code: 'forbidden', message: '', statusCode: 403),
      ),
      build: () => DeviceCubit(pos),
      seed: () => const DeviceState.unregistered(),
      act: (cubit) => cubit.activate('Kasir depan'),
      expect: () => const [
        DeviceState.unregistered(activating: true),
        DeviceState.unregistered(
          error: ApiException(code: 'forbidden', message: '', statusCode: 403),
        ),
      ],
      verify: (_) => verifyNever(() => pos.device()),
    );

    blocTest<DeviceCubit, DeviceState>(
      'sells on a phone that turns out active already',
      setUp: () {
        when(() => pos.activate(any())).thenThrow(
          const ApiException(
            code: 'device_already_active',
            message: '',
            statusCode: 409,
          ),
        );
        when(() => pos.device()).thenAnswer((_) async => testTill());
      },
      build: () => DeviceCubit(pos),
      seed: () => const DeviceState.unregistered(),
      act: (cubit) => cubit.activate('Kasir depan'),
      expect: () => [
        const DeviceState.unregistered(activating: true),
        DeviceState.ready(testTill()),
      ],
    );

    blocTest<DeviceCubit, DeviceState>(
      "checks rather than activates again when the check after it can't run",
      setUp: () {
        when(() => pos.activate(any())).thenAnswer((_) async {});
        when(() => pos.device()).thenThrow(_network);
      },
      build: () => DeviceCubit(pos),
      seed: () => const DeviceState.unregistered(),
      act: (cubit) => cubit.activate('Kasir depan'),
      expect: () => const [
        DeviceState.unregistered(activating: true),
        DeviceState.failed(_network),
      ],
    );

    test('ignores a second tap while activating', () async {
      when(() => pos.device()).thenThrow(_notRegistered);
      final cubit = DeviceCubit(pos);
      addTearDown(cubit.close);
      await cubit.load();
      when(() => pos.activate(any()))
          .thenAnswer((_) => Future<void>.delayed(Duration.zero));
      when(() => pos.device()).thenAnswer((_) async => testTill());

      final first = cubit.activate('Kasir depan');
      await cubit.activate('Kasir depan');
      await cubit.refresh();
      await first;

      verify(() => pos.activate(any())).called(1);
      expect(cubit.state, DeviceState.ready(testTill()));
    });
  });

  test('moves the count past a sale at once, then asks the server', () async {
    when(() => pos.device()).thenAnswer((_) async => testTill());
    final cubit = DeviceCubit(pos);
    addTearDown(cubit.close);
    await cubit.load();
    when(() => pos.device()).thenAnswer((_) async => testTill(nextNumber: 7));
    final states = <DeviceState>[];
    final subscription = cubit.stream.listen(states.add);
    addTearDown(subscription.cancel);

    cubit.sold('BDG01-K01-20261001-0005');
    await pumpEventQueue();

    expect(states, [
      DeviceState.ready(testTill(nextNumber: 6)),
      DeviceState.ready(testTill(nextNumber: 7)),
    ]);
  });
}
