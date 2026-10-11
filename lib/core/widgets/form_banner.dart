import 'package:flutter/material.dart';
import 'package:maki_mobile/app/theme/tokens.dart';

/// A message above a form — an error from the server, or a notice — that a
/// screen reader announces when it appears.
class FormBanner extends StatelessWidget {
  const FormBanner.error(this.message, {super.key}) : _error = true;
  const FormBanner.notice(this.message, {super.key}) : _error = false;

  final String message;
  final bool _error;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      liveRegion: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _error ? colors.errorContainer : colors.primaryContainer,
          borderRadius: BorderRadius.circular(MakiRadii.control),
        ),
        child: Padding(
          padding: const EdgeInsets.all(MakiSpacing.md),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _error
                  ? colors.onErrorContainer
                  : colors.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
