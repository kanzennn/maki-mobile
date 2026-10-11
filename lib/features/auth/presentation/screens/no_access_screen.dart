import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// For a signed-in user this app isn't for: the Owner, or staff whose role
/// doesn't let them check out. The router holds them here. They can check
/// again once their Manager has changed their role — the router then opens
/// the cashier — or sign out, which frees the device for someone else.
class NoAccessScreen extends StatefulWidget {
  const NoAccessScreen({super.key});

  @override
  State<NoAccessScreen> createState() => _NoAccessScreenState();
}

class _NoAccessScreenState extends State<NoAccessScreen> {
  bool _checking = false;
  bool _unchanged = false;

  Future<void> _checkAgain() async {
    setState(() {
      _checking = true;
      _unchanged = false;
    });
    // A refresh brings the account back with its permissions as they are
    // now; if checking out is among them, the router leaves this screen.
    final session = context.read<SessionCubit>();
    await session.refresh();
    if (!mounted) return;
    setState(() {
      _checking = false;
      _unchanged = !(session.user?.canUseCashier ?? true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final user = context.select<SessionCubit, Account?>((s) => s.user);
    if (user == null) return const Scaffold();
    final outlet = user.outlet;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(MakiSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.point_of_sale_outlined,
                    size: 48,
                    color: context.tokens.iconMuted,
                  ),
                  const SizedBox(height: MakiSpacing.lg),
                  Semantics(
                    header: true,
                    child: Text(
                      user.isOwner || outlet == null
                          ? l10n.noAccessOwnerTitle
                          : l10n.noAccessTitle,
                      style: theme.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: MakiSpacing.sm),
                  Text(
                    user.isOwner || outlet == null
                        ? l10n.noAccessOwnerBody
                        : l10n.noAccessBody(outlet.name),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: MakiSpacing.lg),
                  Text(
                    l10n.noAccessSignedInAs(user.name, user.username),
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  if (_unchanged) ...[
                    const SizedBox(height: MakiSpacing.lg),
                    FormBanner.notice(l10n.noAccessUnchanged),
                  ],
                  const SizedBox(height: MakiSpacing.xl),
                  if (!user.isOwner) ...[
                    OutlinedButton(
                      onPressed: _checking
                          ? null
                          : () => unawaited(_checkAgain()),
                      child: Text(l10n.noAccessCheckAgain),
                    ),
                    const SizedBox(height: MakiSpacing.sm),
                  ],
                  FilledButton(
                    onPressed: _checking
                        ? null
                        // The router takes the user to sign-in once the
                        // session ends.
                        : () =>
                              unawaited(context.read<SessionCubit>().signOut()),
                    child: Text(l10n.signOut),
                  ),
                  if (_checking) ...[
                    const SizedBox(height: MakiSpacing.sm),
                    const LinearProgressIndicator(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
