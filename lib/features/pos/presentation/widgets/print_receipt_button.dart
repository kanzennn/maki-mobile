import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/features/pos/data/receipt_printer.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/printer_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/receipt_ticket.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// What the screen says about [problem].
String printerProblemText(AppLocalizations l10n, PrinterProblem problem) =>
    switch (problem) {
      PrinterProblem.noPrinter => l10n.printerProblemNoPrinter,
      PrinterProblem.unavailable => l10n.printerProblemUnavailable,
      PrinterProblem.bluetoothOff => l10n.printerProblemBluetoothOff,
      PrinterProblem.permissionDenied => l10n.printerProblemDenied,
      PrinterProblem.connectFailed => l10n.printerProblemConnect,
      PrinterProblem.sendFailed => l10n.printerProblemSend,
    };

/// Prints [order]'s receipt, and says what went wrong under the button; the
/// sale is saved either way. It works the same inside a dialog, where a
/// snack bar would sit behind the barrier. With [printAtOnce], and the phone
/// set to and with a printer chosen, it prints once as it appears.
class PrintReceiptButton extends StatefulWidget {
  const PrintReceiptButton({
    required this.order,
    required this.outlet,
    required this.label,
    this.printAtOnce = false,
    super.key,
  });

  final Order order;
  final CatalogOutlet outlet;
  final String label;
  final bool printAtOnce;

  @override
  State<PrintReceiptButton> createState() => _PrintReceiptButtonState();
}

class _PrintReceiptButtonState extends State<PrintReceiptButton> {
  PrinterProblem? _problem;

  @override
  void initState() {
    super.initState();
    final settings = context.read<PrinterCubit>().state.settings;
    if (widget.printAtOnce && settings.auto && settings.printer != null) {
      unawaited(_print());
    }
  }

  Future<void> _print() async {
    final problem = await context.read<PrinterCubit>().print(
      (paper) => receiptTicket(
        order: widget.order,
        outlet: widget.outlet,
        paper: paper,
      ),
    );
    if (mounted) setState(() => _problem = problem);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final printing = context.select<PrinterCubit, bool>(
      (c) => c.state.printing,
    );
    final problem = _problem;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton.icon(
          onPressed: printing ? null : _print,
          icon: const Icon(Icons.print_outlined),
          label: Text(printing ? l10n.printerPrinting : widget.label),
        ),
        if (problem != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Semantics(
              liveRegion: true,
              child: Text(
                printerProblemText(l10n, problem),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
