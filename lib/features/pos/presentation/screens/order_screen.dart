import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_mobile/app/routes.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/utils/window_size.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/catalog_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/device_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/checkout_dialog.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/detail_items.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// Detail Items full screen, below 840dp: the cart bar opens it, with the
/// pay button at its foot. From 840dp the panel beside the menus is the
/// same thing, so this screen gives way to the sell screen; it does too on
/// a phone that can't sell yet.
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final catalog = context.select<CatalogCubit, Catalog?>(
      (cubit) => switch (cubit.state) {
        CatalogReady(:final catalog) => catalog,
        _ => null,
      },
    );
    final device = context.select<DeviceCubit, TillDevice?>(
      (cubit) => switch (cubit.state) {
        DeviceReady(:final device) => device,
        _ => null,
      },
    );
    if (catalog == null ||
        device == null ||
        context.windowSize == WindowSize.expanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.goNamed(Routes.pos);
      });
      return const Scaffold();
    }

    Future<void> checkout({bool resend = false}) async {
      await openCheckout(
        context,
        catalog: catalog,
        device: device,
        resend: resend,
      );
      // Sold: back to the menus for the next customer.
      if (context.mounted && context.read<SaleCubit>().state.lines.isEmpty) {
        context.goNamed(Routes.pos);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.cartTitle),
        actions: [
          BlocBuilder<SaleCubit, SaleState>(
            builder: (context, sale) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: MakiSpacing.lg),
                child: Text(
                  l10n.cartItems(priced(sale.lines, catalog).count),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ),
        ],
      ),
      body: DetailItems(
        catalog: catalog,
        showTitle: false,
        showNotices: true,
        onPay: checkout,
        onResend: () => checkout(resend: true),
      ),
    );
  }
}
