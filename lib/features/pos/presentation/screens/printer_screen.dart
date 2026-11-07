import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/pos/data/receipt_printer.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/printer_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/receipt_ticket.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/print_receipt_button.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// This phone's receipt printer: which of the printers paired in Android's
/// settings, its roll, printing without asking, and a test ticket. Pairing
/// itself stays in Android's settings, so the app needs no permission to scan
/// or to know the phone's location.
class PrinterScreen extends StatefulWidget {
  const PrinterScreen({super.key});

  @override
  State<PrinterScreen> createState() => _PrinterScreenState();
}

class _PrinterScreenState extends State<PrinterScreen> {
  PrinterProblem? _testProblem;
  bool _testSent = false;

  @override
  void initState() {
    super.initState();
    // Here, and not before: the permission is asked for when it is needed.
    unawaited(context.read<PrinterCubit>().listPaired());
  }

  Future<void> _test(AppLocalizations l10n) async {
    final problem = await context.read<PrinterCubit>().print(
      (paper) => printerTestTicket(l10n, paper),
    );
    if (!mounted) return;
    setState(() {
      _testProblem = problem;
      _testSent = problem == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.printerTitle)),
      body: BlocBuilder<PrinterCubit, PrinterState>(
        builder: (context, state) {
          final cubit = context.read<PrinterCubit>();
          final chosen = state.settings.printer;
          final testProblem = _testProblem;
          final listProblem = state.listProblem;
          return ListView(
            padding: const EdgeInsets.all(MakiSpacing.lg),
            children: [
              Text(l10n.printerPairHint, style: muted),
              const SizedBox(height: MakiSpacing.md),
              if (listProblem != null) ...[
                FormBanner.error(printerProblemText(l10n, listProblem)),
                const SizedBox(height: MakiSpacing.md),
              ],
              if (state.listing)
                const LinearProgressIndicator()
              else if (state.paired.isEmpty && listProblem == null)
                Text(l10n.printerNonePaired, style: muted),
              for (final printer in state.paired)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  selected: printer.address == chosen?.address,
                  leading: const Icon(Icons.print_outlined),
                  title: Text(printer.name),
                  trailing: printer.address == chosen?.address
                      ? Icon(Icons.check, semanticLabel: l10n.printerChosen)
                      : null,
                  onTap: () => unawaited(cubit.choose(printer)),
                ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton.icon(
                  onPressed: state.listing
                      ? null
                      : () => unawaited(cubit.listPaired()),
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.printerRefresh),
                ),
              ),
              const SizedBox(height: MakiSpacing.md),
              Text(l10n.printerPaper, style: theme.textTheme.titleSmall),
              const SizedBox(height: MakiSpacing.sm),
              SegmentedButton<PaperWidth>(
                segments: const [
                  ButtonSegment(value: PaperWidth.mm58, label: Text('58 mm')),
                  ButtonSegment(value: PaperWidth.mm80, label: Text('80 mm')),
                ],
                selected: {state.settings.paper},
                onSelectionChanged: (picked) =>
                    unawaited(cubit.setPaper(picked.single)),
              ),
              const SizedBox(height: MakiSpacing.md),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.printerAuto),
                value: state.settings.auto,
                onChanged: (auto) => unawaited(cubit.setAuto(auto: auto)),
              ),
              const SizedBox(height: MakiSpacing.md),
              OutlinedButton.icon(
                onPressed: chosen == null || state.printing
                    ? null
                    : () => _test(l10n),
                icon: const Icon(Icons.print_outlined),
                label: Text(
                  state.printing ? l10n.printerPrinting : l10n.printerTest,
                ),
              ),
              if (testProblem != null) ...[
                const SizedBox(height: MakiSpacing.md),
                FormBanner.error(printerProblemText(l10n, testProblem)),
              ] else if (_testSent) ...[
                const SizedBox(height: MakiSpacing.md),
                FormBanner.notice(l10n.printerTestSent),
              ],
            ],
          );
        },
      ),
    );
  }
}
