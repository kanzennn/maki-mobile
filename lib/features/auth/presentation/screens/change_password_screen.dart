import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/auth/data/auth_repository.dart';
import 'package:maki_mobile/features/auth/presentation/cubit/change_password_cubit.dart';
import 'package:maki_mobile/features/auth/presentation/cubit/submit_state.dart';
import 'package:maki_mobile/features/auth/presentation/validators.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// Changes the signed-in user's password. A user whose password someone
/// else set is held here by the router until they choose their own; the
/// server refuses their other requests too.
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        AuthRepository(context.read<MakiApiClient>()),
        context.read<SessionCubit>(),
      ),
      child: const _ChangePasswordForm(),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<_ChangePasswordForm> {
  final _form = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _next = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _current.dispose();
    _next.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_form.currentState?.validate() ?? false)) return;
    unawaited(
      context.read<ChangePasswordCubit>().submit(
        current: _current.text,
        next: _next.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final required = context.select<SessionCubit, bool>(
      (session) => session.user?.mustChangePassword ?? false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.changePasswordTitle),
        automaticallyImplyLeading: !required,
        actions: [
          // Held here, a user can still hand the device to someone else.
          if (required)
            IconButton(
              tooltip: l10n.signOut,
              icon: const Icon(Icons.logout),
              onPressed: () =>
                  unawaited(context.read<SessionCubit>().signOut()),
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(MakiSpacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: BlocConsumer<ChangePasswordCubit, SubmitState>(
                listener: (context, state) {
                  if (state is SubmitDone) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.changePasswordDone)),
                    );
                    context.go('/pos');
                  }
                },
                builder: (context, state) {
                  final submitting = state is SubmitSubmitting;
                  return Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (required) ...[
                          FormBanner.notice(l10n.changePasswordRequired),
                          const SizedBox(height: MakiSpacing.lg),
                        ],
                        if (state case SubmitFailed(:final error)) ...[
                          FormBanner.error(apiErrorMessage(l10n, error)),
                          const SizedBox(height: MakiSpacing.lg),
                        ],
                        TextFormField(
                          controller: _current,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: l10n.currentPasswordLabel,
                          ),
                          autofillHints: const [AutofillHints.password],
                          textInputAction: TextInputAction.next,
                          validator: (value) => requiredField(l10n, value),
                        ),
                        const SizedBox(height: MakiSpacing.md),
                        TextFormField(
                          controller: _next,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: l10n.newPasswordLabel,
                            helperText: l10n.validationMinLength(
                              passwordMinLength,
                            ),
                          ),
                          autofillHints: const [AutofillHints.newPassword],
                          textInputAction: TextInputAction.next,
                          validator: (value) => newPassword(l10n, value),
                        ),
                        const SizedBox(height: MakiSpacing.md),
                        TextFormField(
                          controller: _confirm,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: l10n.confirmPasswordLabel,
                          ),
                          autofillHints: const [AutofillHints.newPassword],
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => _submit(),
                          validator: (value) =>
                              requiredField(l10n, value) ??
                              (value == _next.text
                                  ? null
                                  : l10n.validationMismatch),
                        ),
                        const SizedBox(height: MakiSpacing.lg),
                        FilledButton(
                          onPressed: submitting ? null : _submit,
                          child: Text(l10n.changePasswordSubmit),
                        ),
                        if (submitting) ...[
                          const SizedBox(height: MakiSpacing.sm),
                          const LinearProgressIndicator(),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
