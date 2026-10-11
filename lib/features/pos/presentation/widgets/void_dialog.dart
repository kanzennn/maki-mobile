import 'package:flutter/material.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The most characters a void's reason holds: the server's limit.
const maxVoidReason = 200;

/// Asks for the reason to void the order [orderNo]; null when the cashier
/// thinks better of it.
Future<String?> askVoidReason(BuildContext context, String orderNo) =>
    showDialog<String>(
      context: context,
      builder: (_) => _VoidDialog(orderNo: orderNo),
    );

class _VoidDialog extends StatefulWidget {
  const _VoidDialog({required this.orderNo});

  final String orderNo;

  @override
  State<_VoidDialog> createState() => _VoidDialogState();
}

class _VoidDialogState extends State<_VoidDialog> {
  final _reason = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _reason.dispose();
    super.dispose();
  }

  void _confirm() {
    final reason = _reason.text.trim();
    if (reason.isEmpty) {
      setState(() => _error = AppLocalizations.of(context).validationRequired);
      return;
    }
    Navigator.of(context).pop(reason);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text(l10n.voidTitle(widget.orderNo)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.voidBody),
            const SizedBox(height: MakiSpacing.lg),
            TextField(
              controller: _reason,
              autofocus: true,
              minLines: 1,
              maxLines: 3,
              inputFormatters: const [CodePointLimit(maxVoidReason)],
              decoration: InputDecoration(
                labelText: l10n.voidReason,
                helperText: l10n.voidReasonHint,
                errorText: _error,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          style: inlineButton.merge(
            FilledButton.styleFrom(
              backgroundColor: colors.error,
              foregroundColor: colors.onError,
            ),
          ),
          onPressed: _confirm,
          child: Text(l10n.voidConfirm),
        ),
      ],
    );
  }
}
