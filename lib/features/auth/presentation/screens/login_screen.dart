import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/auth/session_state.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/auth/data/auth_repository.dart';
import 'package:maki_mobile/features/auth/presentation/cubit/login_cubit.dart';
import 'package:maki_mobile/features/auth/presentation/cubit/submit_state.dart';
import 'package:maki_mobile/features/auth/presentation/validators.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        AuthRepository(context.read<MakiApiClient>()),
        context.read<SessionCubit>(),
      ),
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _form = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_form.currentState?.validate() ?? false)) return;
    unawaited(
      context.read<LoginCubit>().submit(
        username: _username.text,
        password: _password.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    // Why the app signed the last user out, when it did so itself.
    final reason = context.select<SessionCubit, SignOutReason?>(
      (session) => switch (session.state) {
        SessionSignedOut(:final reason) => reason,
        SessionSignedIn() => null,
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(MakiSpacing.lg),
            child: ConstrainedBox(
              // A comfortable column on a tablet, the full width on a phone.
              constraints: const BoxConstraints(maxWidth: 400),
              child: BlocConsumer<LoginCubit, SubmitState>(
                listener: (context, state) {
                  if (state is SubmitFailed) {
                    _password.clear();
                    _passwordFocus.requestFocus();
                  }
                },
                builder: (context, state) {
                  final submitting = state is SubmitSubmitting;
                  return AutofillGroup(
                    child: Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.appName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: MakiSpacing.xl),
                          Semantics(
                            header: true,
                            child: Text(
                              l10n.loginTitle,
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          const SizedBox(height: MakiSpacing.sm),
                          Text(
                            l10n.loginSubtitle,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: MakiSpacing.lg),
                          if (reason == SignOutReason.deviceRevoked) ...[
                            FormBanner.notice(l10n.loginDeviceRevoked),
                            const SizedBox(height: MakiSpacing.lg),
                          ],
                          if (state case SubmitFailed(:final error)) ...[
                            FormBanner.error(apiErrorMessage(l10n, error)),
                            const SizedBox(height: MakiSpacing.lg),
                          ],
                          TextFormField(
                            controller: _username,
                            decoration: InputDecoration(
                              labelText: l10n.usernameLabel,
                            ),
                            autofillHints: const [AutofillHints.username],
                            autocorrect: false,
                            enableSuggestions: false,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                _passwordFocus.requestFocus(),
                            validator: (value) => requiredField(l10n, value),
                          ),
                          const SizedBox(height: MakiSpacing.md),
                          TextFormField(
                            controller: _password,
                            focusNode: _passwordFocus,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: l10n.passwordLabel,
                            ),
                            autofillHints: const [AutofillHints.password],
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                            validator: (value) => requiredField(l10n, value),
                          ),
                          const SizedBox(height: MakiSpacing.lg),
                          FilledButton(
                            onPressed: submitting ? null : _submit,
                            child: Text(l10n.loginSubmit),
                          ),
                          if (submitting) ...[
                            const SizedBox(height: MakiSpacing.sm),
                            const LinearProgressIndicator(),
                          ],
                          const SizedBox(height: MakiSpacing.lg),
                          Text(
                            l10n.loginForgotHint,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
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
