import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/device_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// Who is signed in, where, on which device, and today's date at the
/// outlet: what DESIGN.md's phone layout moves off the sell screen. Signing
/// out frees the phone for the next cashier; with an order being rung up,
/// it asks first.
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, this.now = DateTime.now});

  /// The clock for today's date; tests pass a fixed one.
  final DateTime Function() now;

  Future<void> _signOut(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final session = context.read<SessionCubit>();
    final sale = context.read<SaleCubit>().state;
    if (sale.lines.isNotEmpty || sale.pending != null) {
      final sure = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.signOutConfirmTitle),
          content: Text(l10n.signOutConfirmBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              style: inlineButton,
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.signOut),
            ),
          ],
        ),
      );
      if (sure != true) return;
    }
    // The router takes the user to sign-in once the session ends.
    unawaited(session.signOut());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final user = context.select<SessionCubit, Account?>((s) => s.user);
    final device = context.select<DeviceCubit, TillDevice?>(
      (cubit) => switch (cubit.state) {
        DeviceReady(:final device) => device,
        _ => null,
      },
    );
    if (user == null) return const Scaffold();
    final outlet = user.outlet;

    Widget item(IconData icon, String label, String value) => ListTile(
      leading: Icon(icon, color: context.tokens.iconMuted),
      title: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w400,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      subtitle: Text(
        value,
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.accountTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: MakiSpacing.sm),
        children: [
          item(
            Icons.person_outline,
            l10n.accountSignedIn,
            '${user.name} (@${user.username})',
          ),
          if (outlet != null) ...[
            item(Icons.storefront_outlined, l10n.accountOutlet, outlet.name),
            item(
              Icons.phone_android,
              l10n.accountDevice,
              device == null
                  ? l10n.accountDeviceNone
                  : l10n.posDevice(device.code, device.name),
            ),
            item(
              Icons.today_outlined,
              l10n.accountToday,
              // Today where the outlet is, which the phone's own clock
              // setting doesn't decide.
              formatDate(now().toUtc(), l10n.localeName, outlet.timeZone),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(MakiSpacing.lg),
            child: OutlinedButton.icon(
              onPressed: () => _signOut(context),
              icon: const Icon(Icons.logout),
              label: Text(l10n.signOut),
            ),
          ),
        ],
      ),
    );
  }
}
