// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Maki';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginSubtitle => 'Sign in with your username and password.';

  @override
  String get usernameLabel => 'Username';

  @override
  String get passwordLabel => 'Password';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginForgotHint =>
      'Forgot your password? Ask your Manager or the Owner to reset it.';

  @override
  String get loginDeviceRevoked =>
      'This phone was revoked as one of the outlet\'s cashier devices, so you were signed out. To use it again, a Manager signs in on it and activates it as a new device.';

  @override
  String get validationRequired => 'Required.';

  @override
  String validationMinLength(int min) {
    return 'At least $min characters.';
  }

  @override
  String validationMaxLength(int max) {
    return 'At most $max characters.';
  }

  @override
  String get validationMismatch => 'The passwords don\'t match.';

  @override
  String get changePasswordTitle => 'Change your password';

  @override
  String get changePasswordRequired =>
      'Someone else set your password. Choose your own before you continue.';

  @override
  String get currentPasswordLabel => 'Current password';

  @override
  String get newPasswordLabel => 'New password';

  @override
  String get confirmPasswordLabel => 'Repeat the new password';

  @override
  String get changePasswordSubmit => 'Save the password';

  @override
  String get changePasswordDone =>
      'Your password was changed. Other devices signed in with this account were signed out.';

  @override
  String get signOut => 'Sign out';

  @override
  String get navCashier => 'Cashier';

  @override
  String get navHistory => 'History';

  @override
  String get navAccount => 'Account';

  @override
  String get posMenuHeading => 'Select menu';

  @override
  String posDevice(String code, String name) {
    return '$code · $name';
  }

  @override
  String get posSearchLabel => 'Search menu';

  @override
  String get posClearSearch => 'Clear search';

  @override
  String get posCategories => 'Categories';

  @override
  String get posAllMenus => 'All menus';

  @override
  String posCategoryItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String posStockAvailable(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString available';
  }

  @override
  String get posStockAlways => 'Always available';

  @override
  String get posStockOut => 'Sold out';

  @override
  String get posStockLow => 'Low stock';

  @override
  String posInCart(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString in the order';
  }

  @override
  String get posMenusNone =>
      'No menu is on sale yet. A Manager adds them on the Menu page of the web admin.';

  @override
  String get posMenusNoMatch => 'No menu matches.';

  @override
  String get posLoadFailed => 'The cashier\'s menu couldn\'t load.';

  @override
  String get cartTitle => 'Detail Items';

  @override
  String cartItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get cartEmpty => 'No order yet. Pick a menu to start.';

  @override
  String get cartType => 'Order type';

  @override
  String get orderTypeDineIn => 'Dine-in';

  @override
  String get orderTypeTakeaway => 'Takeaway';

  @override
  String cartLess(String name) {
    return 'One less $name';
  }

  @override
  String cartMore(String name) {
    return 'One more $name';
  }

  @override
  String cartRemove(String name) {
    return 'Remove $name';
  }

  @override
  String get cartNote => 'Note';

  @override
  String cartNoteFor(String name) {
    return 'Note for $name';
  }

  @override
  String get cartNoteHint => 'Such as less sugar';

  @override
  String cartLine(int qty, String price) {
    final intl.NumberFormat qtyNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String qtyString = qtyNumberFormat.format(qty);

    return '$qtyString × $price';
  }

  @override
  String cartStockLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString left in stock';
  }

  @override
  String get summaryItems => 'Items';

  @override
  String get summarySubtotal => 'Subtotal';

  @override
  String get summaryDiscount => 'Discount';

  @override
  String summaryService(String rate) {
    return 'Service ($rate)';
  }

  @override
  String summaryTax(String rate) {
    return 'Tax ($rate)';
  }

  @override
  String get summaryTotal => 'Total';

  @override
  String get cartMethod => 'Payment method';

  @override
  String get methodCash => 'Cash';

  @override
  String get methodQris => 'QRIS';

  @override
  String get methodDebit => 'Debit';

  @override
  String get cartSoon => 'Coming soon';

  @override
  String cartPay(String total) {
    return 'Pay $total';
  }

  @override
  String get cartView => 'View order';

  @override
  String get cartLocked =>
      'The last sale has no answer yet. Settle it before changing the order.';

  @override
  String cartTooMuch(String amount) {
    return 'An order comes to $amount at most.';
  }

  @override
  String get cartNoCash => 'This outlet isn\'t taking cash right now.';

  @override
  String get payTitle => 'Pay in cash';

  @override
  String get payTotal => 'Total';

  @override
  String get payReceived => 'Cash received';

  @override
  String get payQuick => 'Quick amounts';

  @override
  String get payExact => 'Exact';

  @override
  String get payChange => 'Change';

  @override
  String payShort(String amount) {
    return '$amount short';
  }

  @override
  String get payConfirm => 'Pay';

  @override
  String get paySending => 'Saving…';

  @override
  String get payUnknown =>
      'The server hasn\'t answered, so this sale may have been saved. Send it again: the same sale is never recorded twice.';

  @override
  String get payResend => 'Send again';

  @override
  String get payAbandon => 'Let this sale go';

  @override
  String get payAbandonWarning =>
      'The order can change again. Check History before charging again: this sale may have been saved.';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get retry => 'Try again';

  @override
  String errorRequestId(String id) {
    return 'Reference: $id';
  }

  @override
  String changedPrices(String names) {
    return 'The price of $names changed.';
  }

  @override
  String changedUnavailable(String names) {
    return '$names is no longer on sale, so it was taken out of the order.';
  }

  @override
  String changedStock(String names) {
    return 'There isn\'t enough $names anymore, so the quantity was cut.';
  }

  @override
  String get changedTotal =>
      'The outlet\'s tax or service charge, or the voucher\'s terms, changed.';

  @override
  String get changedMethod => 'This payment method isn\'t available.';

  @override
  String get changedCheck =>
      'Check the order and its total, then charge again.';

  @override
  String get changedClock =>
      'This phone\'s clock is off. Check the date and time in the phone\'s settings, then charge again.';

  @override
  String listAnd(String first, String last) {
    return '$first and $last';
  }

  @override
  String get doneTitle => 'Sale saved';

  @override
  String doneChange(String amount) {
    return 'Change $amount';
  }

  @override
  String get doneNew => 'Next customer';

  @override
  String receiptLabel(String number) {
    return 'Receipt $number';
  }

  @override
  String get receiptNumber => 'Receipt no.';

  @override
  String get receiptDate => 'Time';

  @override
  String get receiptCashier => 'Cashier';

  @override
  String get receiptType => 'Type';

  @override
  String receiptService(String rate) {
    return 'Service $rate';
  }

  @override
  String receiptTax(String rate) {
    return 'Tax $rate';
  }

  @override
  String get receiptChange => 'Change';

  @override
  String get receiptVoid => 'VOID';

  @override
  String receiptVoidReason(String reason) {
    return 'Reason: $reason';
  }

  @override
  String get receiptThanks => 'Thank you';

  @override
  String get deviceNotRegisteredTitle => 'This device isn\'t registered';

  @override
  String deviceNotRegisteredBody(String outlet) {
    return 'The cashier only works on a device activated for $outlet. Ask a Manager to sign in on this phone and activate it.';
  }

  @override
  String deviceNotRegisteredManager(String outlet) {
    return 'Name this phone, then activate it as one of $outlet\'s cashiers. Its code goes into every receipt number it makes.';
  }

  @override
  String get deviceName => 'Device name';

  @override
  String get deviceNameHint => 'Such as Front till. 50 characters at most.';

  @override
  String get deviceActivate => 'Activate this device';

  @override
  String get deviceActivating => 'Activating…';

  @override
  String get deviceCheckFailed => 'This device couldn\'t be checked.';

  @override
  String get historyTitle => 'Today\'s orders';

  @override
  String get historySearch => 'Search receipt number';

  @override
  String get historySearchHint => 'Such as 0012';

  @override
  String get historyPaid => 'Paid';

  @override
  String get historyVoid => 'Void';

  @override
  String get historyEmpty => 'No orders today yet.';

  @override
  String get historyNoMatch => 'No order today has that number.';

  @override
  String historyItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get historyMore => 'Load more';

  @override
  String get historyLoadFailed => 'Today\'s orders couldn\'t load.';

  @override
  String get orderTitle => 'Order details';

  @override
  String get orderLoadFailed => 'This order couldn\'t load.';

  @override
  String get voidAction => 'Void order';

  @override
  String voidTitle(String number) {
    return 'Void order $number?';
  }

  @override
  String get voidBody =>
      'The order and its payment are cancelled, and its stock comes back. This can\'t be undone.';

  @override
  String get voidReason => 'Reason';

  @override
  String get voidReasonHint => 'Required, 200 characters at most.';

  @override
  String get voidConfirm => 'Void';

  @override
  String voidDone(String number) {
    return 'Order $number was voided.';
  }

  @override
  String get accountTitle => 'Account';

  @override
  String get accountSignedIn => 'Signed in as';

  @override
  String get accountOutlet => 'Outlet';

  @override
  String get accountDevice => 'This device';

  @override
  String get accountDeviceNone => 'Not activated as a cashier';

  @override
  String get accountToday => 'Today at the outlet';

  @override
  String get signOutConfirmTitle => 'Sign out of the cashier?';

  @override
  String get signOutConfirmBody => 'The order being rung up will be lost.';

  @override
  String get apiErrorForbidden => 'You don\'t have permission to do this.';

  @override
  String get apiErrorOutletNotFound =>
      'This outlet doesn\'t exist, or you have no access to it.';

  @override
  String get apiErrorOutletInactive =>
      'Your outlet is deactivated. Contact the Owner.';

  @override
  String get apiErrorDeviceNotRegistered =>
      'This device isn\'t registered as one of the outlet\'s cashiers. Ask a Manager to sign in on this phone and activate it.';

  @override
  String get apiErrorDeviceRevoked =>
      'This device was revoked, so it can\'t sell.';

  @override
  String get apiErrorDeviceAlreadyActive =>
      'This device is already one of the outlet\'s cashiers.';

  @override
  String get apiErrorOrderNotFound => 'This order isn\'t one of the outlet\'s.';

  @override
  String get apiErrorOrderAlreadyVoid => 'This order was already voided.';

  @override
  String get apiErrorOrderIdConflict =>
      'Another order has this ID. Ring the order up again.';

  @override
  String get apiErrorOrderNoTaken =>
      'This receipt number is taken. Charge again to use the next one.';

  @override
  String get noAccessTitle => 'No cashier access yet';

  @override
  String noAccessBody(String outlet) {
    return 'Your role at $outlet doesn\'t allow checking out yet. Ask your outlet\'s Manager to add it, then check again.';
  }

  @override
  String get noAccessOwnerTitle => 'This app is for cashiers';

  @override
  String get noAccessOwnerBody =>
      'The Owner account is for Maki\'s web admin. This Android app is for Managers and staff who check out at the cashier.';

  @override
  String noAccessSignedInAs(String name, String username) {
    return 'Signed in as $name (@$username)';
  }

  @override
  String get noAccessCheckAgain => 'Check again';

  @override
  String get noAccessUnchanged => 'Your access hasn\'t changed.';

  @override
  String get apiErrorInternal =>
      'Something went wrong on the server. Please try again.';

  @override
  String get apiErrorNotFound => 'The data wasn\'t found.';

  @override
  String get apiErrorNotReady =>
      'The service is unavailable right now. Please try again in a moment.';

  @override
  String get apiErrorNetwork =>
      'Can\'t reach the server. Check your internet connection.';

  @override
  String get apiErrorInvalidCredentials => 'Wrong username or password.';

  @override
  String get apiErrorAccountDisabled =>
      'This account is disabled. Contact your Manager or the Owner.';

  @override
  String apiErrorRateLimited(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Too many attempts. Try again in $minutes minutes.',
      one: 'Too many attempts. Try again in 1 minute.',
    );
    return '$_temp0';
  }

  @override
  String get apiErrorWrongPassword => 'The current password is wrong.';

  @override
  String apiErrorPasswordTooShort(int min) {
    return 'The password needs at least $min characters.';
  }

  @override
  String apiErrorPasswordTooLong(int max) {
    return 'The password can have at most $max characters.';
  }

  @override
  String get apiErrorPasswordSameAsUsername =>
      'The password can\'t be the same as the username.';

  @override
  String get apiErrorUnauthorized =>
      'Your session has ended. Please sign in again.';

  @override
  String get apiErrorValidation => 'Check the highlighted fields.';

  @override
  String get voucherLabel => 'Voucher';

  @override
  String get voucherHint => 'Voucher code';

  @override
  String get voucherApply => 'Apply';

  @override
  String get voucherChecking => 'Checking…';

  @override
  String voucherRemove(String code) {
    return 'Remove voucher $code';
  }

  @override
  String voucherMinSpend(String amount) {
    return 'This voucher needs a subtotal of at least $amount. Add to the order or remove the voucher.';
  }

  @override
  String voucherRemoved(String code, String reason) {
    return 'Voucher $code was removed: $reason';
  }

  @override
  String summaryVoucher(String code) {
    return 'Discount ($code)';
  }

  @override
  String get apiErrorVoucherNotFound => 'There\'s no voucher with this code.';

  @override
  String get apiErrorVoucherInactive => 'This voucher is turned off.';

  @override
  String get apiErrorVoucherNotStarted => 'This voucher isn\'t valid yet.';

  @override
  String get apiErrorVoucherExpired => 'This voucher has expired.';

  @override
  String get apiErrorVoucherUsedUp => 'This voucher has been used up.';

  @override
  String get apiErrorVoucherNotForOutlet =>
      'This voucher isn\'t valid at this outlet.';

  @override
  String get apiErrorVoucherMinSpend =>
      'This order is below the voucher\'s minimum spend.';

  @override
  String get navTables => 'Tables';

  @override
  String get tablesTitle => 'Tables';

  @override
  String get tablesIntro =>
      'Pick a table to see its status, order at it, or release it once its customers have gone.';

  @override
  String get tablesEmpty =>
      'This outlet has no tables yet. The Manager adds them on the admin Tables page.';

  @override
  String get tablesLoadFailed => 'The tables couldn\'t load.';

  @override
  String get tableLegend => 'Key:';

  @override
  String get tableStatusAvailable => 'Available';

  @override
  String get tableStatusOccupied => 'Occupied';

  @override
  String get tableStatusInactive => 'Inactive';

  @override
  String get tableStatusScheduled => 'Scheduled off';

  @override
  String get decorationWall => 'Wall';

  @override
  String get decorationCashier => 'Cashier';

  @override
  String get decorationDoor => 'Door';

  @override
  String tableSeats(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString seats',
      one: '1 seat',
    );
    return '$_temp0';
  }

  @override
  String tableLabel(String name, String status) {
    return 'Table $name, $status';
  }

  @override
  String tableLabelSeats(String name, String status, String seats) {
    return 'Table $name, $status, $seats';
  }

  @override
  String tableLayout(String area) {
    return 'Layout of the $area area';
  }

  @override
  String get tableUnplaced => 'Not placed on the layout:';

  @override
  String tableDetailTitle(String name) {
    return 'Table $name';
  }

  @override
  String get tableSeatsTerm => 'Seats';

  @override
  String get tableNoSeats => 'Not given';

  @override
  String get tableSince => 'Seated since';

  @override
  String get tableOrders => 'Sales';

  @override
  String get tableInactiveNote =>
      'The Manager has turned this table off, so it can\'t be picked.';

  @override
  String get tableScheduledNote =>
      'This table is scheduled off, so it can\'t be picked.';

  @override
  String get tableOrderHere => 'Order at this table';

  @override
  String get tablePendingHint =>
      'The last sale has no answer yet. Settle it first in Detail Items.';

  @override
  String get tableRelease => 'Release table';

  @override
  String tableReleaseTitle(String name) {
    return 'Release table $name?';
  }

  @override
  String get tableReleaseBody =>
      'Do this once the customers have left. The table is free again for the next ones.';

  @override
  String tableReleased(String name) {
    return 'Table $name released.';
  }

  @override
  String get tablePickTitle => 'Pick a table';

  @override
  String get tablePickIntro =>
      'Available and occupied tables can be picked. An order more at the same table is a sale of its own.';

  @override
  String get tablePick => 'Pick a table';

  @override
  String get tablePickOptional => 'Optional';

  @override
  String tableChosen(String name) {
    return 'Table $name';
  }

  @override
  String get tableChange => 'Change';

  @override
  String tableLetGo(String name) {
    return 'Let go of table $name';
  }

  @override
  String tableRemoved(String name, String reason) {
    return 'Table $name taken off the order: $reason';
  }

  @override
  String get tableUnavailableInactive => 'it has been turned off.';

  @override
  String get tableUnavailableScheduled => 'it is scheduled off.';

  @override
  String get tableUnavailableMissing => 'it has been deleted.';

  @override
  String get receiptTable => 'Table';

  @override
  String historyTable(String name) {
    return 'Table $name';
  }

  @override
  String get apiErrorTableUnavailable => 'This table can\'t be chosen now.';

  @override
  String get apiErrorTableNotFound => 'Table not found.';

  @override
  String get standLabel => 'Stand number';

  @override
  String get standPlaceholder => 'For example 12';

  @override
  String get standHint =>
      'Needed for dine-in: the number on the customer\'s stand.';

  @override
  String get standFormat =>
      '1–10 letters, digits or hyphens, for example 12, A5 or B-3.';

  @override
  String standTableDropped(String name) {
    return 'This outlet now uses number stands, so table $name was taken off the order. Type the number on the customer\'s stand.';
  }

  @override
  String standDropped(String number) {
    return 'This outlet now uses tables, so stand number $number was taken off the order.';
  }

  @override
  String get standNowNumber =>
      'This outlet now uses number stands. Type the number on the customer\'s stand.';

  @override
  String get receiptStand => 'Stand number';

  @override
  String historyStand(String number) {
    return 'No. $number';
  }

  @override
  String get tablesNumberMode =>
      'This outlet uses number stands: dine-in customers take a numbered stand, and the cashier types its number in Detail Items instead of picking a table.';

  @override
  String get apiErrorDineInModeChanged =>
      'How this outlet seats its dine-in customers just changed: at tables, or by number stands.';
}
