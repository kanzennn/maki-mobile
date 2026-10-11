import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/device_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The most characters a device's name holds: the server's limit.
const maxDeviceName = 50;

/// A phone that isn't one of the outlet's cashier devices. Its Manager,
/// signed in on it, names it and activates it here; anyone else learns who
/// can.
class DeviceGate extends StatefulWidget {
  const DeviceGate({required this.state, super.key});

  final DeviceUnregistered state;

  @override
  State<DeviceGate> createState() => _DeviceGateState();
}

class _DeviceGateState extends State<DeviceGate> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _activate() {
    if (!(_form.currentState?.validate() ?? false)) return;
    unawaited(context.read<DeviceCubit>().activate(_name.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final user = context.select<SessionCubit, Account?>((s) => s.user);
    final outlet = user?.outlet?.name ?? '';
    final manager = user?.isManager ?? false;
    final DeviceUnregistered(:activating, :error) = widget.state;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(MakiSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.phonelink_lock_outlined,
                      size: 48,
                      color: context.tokens.iconMuted,
                    ),
                    const SizedBox(height: MakiSpacing.lg),
                    Semantics(
                      header: true,
                      child: Text(
                        l10n.deviceNotRegisteredTitle,
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: MakiSpacing.sm),
                    Text(
                      manager
                          ? l10n.deviceNotRegisteredManager(outlet)
                          : l10n.deviceNotRegisteredBody(outlet),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (manager) ...[
                      const SizedBox(height: MakiSpacing.xl),
                      if (error != null) ...[
                        FormBanner.error(apiErrorMessage(l10n, error)),
                        const SizedBox(height: MakiSpacing.lg),
                      ],
                      TextFormField(
                        controller: _name,
                        enabled: !activating,
                        decoration: InputDecoration(
                          labelText: l10n.deviceName,
                          helperText: l10n.deviceNameHint,
                          helperMaxLines: 2,
                        ),
                        textInputAction: TextInputAction.done,
                        inputFormatters: const [CodePointLimit(maxDeviceName)],
                        onFieldSubmitted: (_) => _activate(),
                        validator: (value) => (value ?? '').trim().isEmpty
                            ? l10n.validationRequired
                            : null,
                      ),
                      const SizedBox(height: MakiSpacing.lg),
                      FilledButton(
                        onPressed: activating ? null : _activate,
                        child: Text(
                          activating
                              ? l10n.deviceActivating
                              : l10n.deviceActivate,
                        ),
                      ),
                      if (activating) ...[
                        const SizedBox(height: MakiSpacing.sm),
                        const LinearProgressIndicator(),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
