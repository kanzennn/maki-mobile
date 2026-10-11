import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// App name in the task switcher and title.
  ///
  /// In id, this message translates to:
  /// **'Maki'**
  String get appName;

  /// No description provided for @loginTitle.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Masuk dengan username dan password Anda.'**
  String get loginSubtitle;

  /// No description provided for @usernameLabel.
  ///
  /// In id, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In id, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @loginSubmit.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get loginSubmit;

  /// No description provided for @loginForgotHint.
  ///
  /// In id, this message translates to:
  /// **'Lupa password? Minta Manager atau Owner mereset password Anda.'**
  String get loginForgotHint;

  /// On the sign-in screen, after the app signed the user out because the outlet revoked this phone.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini sudah dicabut dari kasir outlet, jadi Anda dikeluarkan. Untuk memakainya lagi, Manager masuk di perangkat ini lalu mengaktifkannya sebagai perangkat baru.'**
  String get loginDeviceRevoked;

  /// No description provided for @validationRequired.
  ///
  /// In id, this message translates to:
  /// **'Wajib diisi.'**
  String get validationRequired;

  /// No description provided for @validationMinLength.
  ///
  /// In id, this message translates to:
  /// **'Minimal {min} karakter.'**
  String validationMinLength(int min);

  /// No description provided for @validationMaxLength.
  ///
  /// In id, this message translates to:
  /// **'Maksimal {max} karakter.'**
  String validationMaxLength(int max);

  /// No description provided for @validationMismatch.
  ///
  /// In id, this message translates to:
  /// **'Password tidak sama.'**
  String get validationMismatch;

  /// No description provided for @changePasswordTitle.
  ///
  /// In id, this message translates to:
  /// **'Ganti password'**
  String get changePasswordTitle;

  /// No description provided for @changePasswordRequired.
  ///
  /// In id, this message translates to:
  /// **'Password Anda dibuat oleh orang lain. Buat password Anda sendiri sebelum melanjutkan.'**
  String get changePasswordRequired;

  /// No description provided for @currentPasswordLabel.
  ///
  /// In id, this message translates to:
  /// **'Password saat ini'**
  String get currentPasswordLabel;

  /// No description provided for @newPasswordLabel.
  ///
  /// In id, this message translates to:
  /// **'Password baru'**
  String get newPasswordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In id, this message translates to:
  /// **'Ulangi password baru'**
  String get confirmPasswordLabel;

  /// No description provided for @changePasswordSubmit.
  ///
  /// In id, this message translates to:
  /// **'Simpan password'**
  String get changePasswordSubmit;

  /// No description provided for @changePasswordDone.
  ///
  /// In id, this message translates to:
  /// **'Password sudah diganti. Perangkat lain yang masuk dengan akun ini sudah dikeluarkan.'**
  String get changePasswordDone;

  /// No description provided for @signOut.
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get signOut;

  /// Bottom navigation and rail: the sell screen.
  ///
  /// In id, this message translates to:
  /// **'Kasir'**
  String get navCashier;

  /// Bottom navigation and rail: today's orders.
  ///
  /// In id, this message translates to:
  /// **'Riwayat'**
  String get navHistory;

  /// Bottom navigation and rail: who is signed in, this device, sign-out.
  ///
  /// In id, this message translates to:
  /// **'Akun'**
  String get navAccount;

  /// No description provided for @posMenuHeading.
  ///
  /// In id, this message translates to:
  /// **'Pilih menu'**
  String get posMenuHeading;

  /// This phone as one of the outlet's devices: its code and name.
  ///
  /// In id, this message translates to:
  /// **'{code} · {name}'**
  String posDevice(String code, String name);

  /// No description provided for @posSearchLabel.
  ///
  /// In id, this message translates to:
  /// **'Cari menu'**
  String get posSearchLabel;

  /// No description provided for @posClearSearch.
  ///
  /// In id, this message translates to:
  /// **'Hapus pencarian'**
  String get posClearSearch;

  /// No description provided for @posCategories.
  ///
  /// In id, this message translates to:
  /// **'Kategori'**
  String get posCategories;

  /// No description provided for @posAllMenus.
  ///
  /// In id, this message translates to:
  /// **'Semua menu'**
  String get posAllMenus;

  /// Under a category tile: how many of its menus are on sale.
  ///
  /// In id, this message translates to:
  /// **'{count} item'**
  String posCategoryItems(int count);

  /// No description provided for @posStockAvailable.
  ///
  /// In id, this message translates to:
  /// **'Tersedia {count}'**
  String posStockAvailable(int count);

  /// No description provided for @posStockAlways.
  ///
  /// In id, this message translates to:
  /// **'Selalu tersedia'**
  String get posStockAlways;

  /// No description provided for @posStockOut.
  ///
  /// In id, this message translates to:
  /// **'Habis'**
  String get posStockOut;

  /// No description provided for @posStockLow.
  ///
  /// In id, this message translates to:
  /// **'Stok menipis'**
  String get posStockLow;

  /// On a menu card: how many of it the order holds.
  ///
  /// In id, this message translates to:
  /// **'{count} di pesanan'**
  String posInCart(int count);

  /// No description provided for @posMenusNone.
  ///
  /// In id, this message translates to:
  /// **'Belum ada menu yang dijual. Manager menambahkannya di halaman Menu di web admin.'**
  String get posMenusNone;

  /// No description provided for @posMenusNoMatch.
  ///
  /// In id, this message translates to:
  /// **'Tidak ada menu yang cocok.'**
  String get posMenusNoMatch;

  /// No description provided for @posLoadFailed.
  ///
  /// In id, this message translates to:
  /// **'Menu kasir tidak bisa dimuat.'**
  String get posLoadFailed;

  /// DESIGN.md's name for the order panel.
  ///
  /// In id, this message translates to:
  /// **'Detail Items'**
  String get cartTitle;

  /// No description provided for @cartItems.
  ///
  /// In id, this message translates to:
  /// **'{count} item'**
  String cartItems(int count);

  /// No description provided for @cartEmpty.
  ///
  /// In id, this message translates to:
  /// **'Belum ada pesanan. Pilih menu untuk mulai.'**
  String get cartEmpty;

  /// No description provided for @cartType.
  ///
  /// In id, this message translates to:
  /// **'Tipe pesanan'**
  String get cartType;

  /// No description provided for @orderTypeDineIn.
  ///
  /// In id, this message translates to:
  /// **'Dine-in'**
  String get orderTypeDineIn;

  /// No description provided for @orderTypeTakeaway.
  ///
  /// In id, this message translates to:
  /// **'Takeaway'**
  String get orderTypeTakeaway;

  /// No description provided for @cartLess.
  ///
  /// In id, this message translates to:
  /// **'Kurangi {name}'**
  String cartLess(String name);

  /// No description provided for @cartMore.
  ///
  /// In id, this message translates to:
  /// **'Tambah {name}'**
  String cartMore(String name);

  /// No description provided for @cartRemove.
  ///
  /// In id, this message translates to:
  /// **'Hapus {name}'**
  String cartRemove(String name);

  /// No description provided for @cartNote.
  ///
  /// In id, this message translates to:
  /// **'Catatan'**
  String get cartNote;

  /// No description provided for @cartNoteFor.
  ///
  /// In id, this message translates to:
  /// **'Catatan untuk {name}'**
  String cartNoteFor(String name);

  /// No description provided for @cartNoteHint.
  ///
  /// In id, this message translates to:
  /// **'Misalnya less sugar'**
  String get cartNoteHint;

  /// A cart line's quantity and unit price.
  ///
  /// In id, this message translates to:
  /// **'{qty} × {price}'**
  String cartLine(int qty, String price);

  /// No description provided for @cartStockLeft.
  ///
  /// In id, this message translates to:
  /// **'Sisa stok {count}'**
  String cartStockLeft(int count);

  /// No description provided for @summaryItems.
  ///
  /// In id, this message translates to:
  /// **'Item'**
  String get summaryItems;

  /// No description provided for @summarySubtotal.
  ///
  /// In id, this message translates to:
  /// **'Subtotal'**
  String get summarySubtotal;

  /// No description provided for @summaryDiscount.
  ///
  /// In id, this message translates to:
  /// **'Potongan'**
  String get summaryDiscount;

  /// No description provided for @summaryService.
  ///
  /// In id, this message translates to:
  /// **'Service ({rate})'**
  String summaryService(String rate);

  /// No description provided for @summaryTax.
  ///
  /// In id, this message translates to:
  /// **'Pajak ({rate})'**
  String summaryTax(String rate);

  /// No description provided for @summaryTotal.
  ///
  /// In id, this message translates to:
  /// **'Total'**
  String get summaryTotal;

  /// No description provided for @cartMethod.
  ///
  /// In id, this message translates to:
  /// **'Metode bayar'**
  String get cartMethod;

  /// No description provided for @methodCash.
  ///
  /// In id, this message translates to:
  /// **'Tunai'**
  String get methodCash;

  /// No description provided for @methodQris.
  ///
  /// In id, this message translates to:
  /// **'QRIS'**
  String get methodQris;

  /// No description provided for @methodDebit.
  ///
  /// In id, this message translates to:
  /// **'Debit'**
  String get methodDebit;

  /// No description provided for @cartSoon.
  ///
  /// In id, this message translates to:
  /// **'Segera hadir'**
  String get cartSoon;

  /// No description provided for @cartPay.
  ///
  /// In id, this message translates to:
  /// **'Bayar {total}'**
  String cartPay(String total);

  /// No description provided for @cartView.
  ///
  /// In id, this message translates to:
  /// **'Lihat pesanan'**
  String get cartView;

  /// No description provided for @cartLocked.
  ///
  /// In id, this message translates to:
  /// **'Transaksi sebelumnya belum terjawab. Selesaikan dulu sebelum mengubah pesanan.'**
  String get cartLocked;

  /// No description provided for @cartTooMuch.
  ///
  /// In id, this message translates to:
  /// **'Total pesanan paling banyak {amount}.'**
  String cartTooMuch(String amount);

  /// No description provided for @cartNoCash.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini sedang tidak menerima tunai.'**
  String get cartNoCash;

  /// No description provided for @payTitle.
  ///
  /// In id, this message translates to:
  /// **'Bayar tunai'**
  String get payTitle;

  /// No description provided for @payTotal.
  ///
  /// In id, this message translates to:
  /// **'Total'**
  String get payTotal;

  /// No description provided for @payReceived.
  ///
  /// In id, this message translates to:
  /// **'Uang diterima'**
  String get payReceived;

  /// No description provided for @payQuick.
  ///
  /// In id, this message translates to:
  /// **'Nominal cepat'**
  String get payQuick;

  /// No description provided for @payExact.
  ///
  /// In id, this message translates to:
  /// **'Uang pas'**
  String get payExact;

  /// No description provided for @payChange.
  ///
  /// In id, this message translates to:
  /// **'Kembalian'**
  String get payChange;

  /// No description provided for @payShort.
  ///
  /// In id, this message translates to:
  /// **'Kurang {amount}'**
  String payShort(String amount);

  /// No description provided for @payConfirm.
  ///
  /// In id, this message translates to:
  /// **'Bayar'**
  String get payConfirm;

  /// No description provided for @paySending.
  ///
  /// In id, this message translates to:
  /// **'Menyimpan…'**
  String get paySending;

  /// No description provided for @payUnknown.
  ///
  /// In id, this message translates to:
  /// **'Server belum menjawab, jadi transaksi ini mungkin sudah tersimpan. Kirim ulang: transaksi yang sama tidak akan tercatat dua kali.'**
  String get payUnknown;

  /// No description provided for @payResend.
  ///
  /// In id, this message translates to:
  /// **'Kirim ulang'**
  String get payResend;

  /// No description provided for @payAbandon.
  ///
  /// In id, this message translates to:
  /// **'Batalkan transaksi ini'**
  String get payAbandon;

  /// No description provided for @payAbandonWarning.
  ///
  /// In id, this message translates to:
  /// **'Pesanan bisa diubah lagi. Periksa Riwayat sebelum menagih lagi: transaksi ini mungkin sudah tersimpan.'**
  String get payAbandonWarning;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In id, this message translates to:
  /// **'Tutup'**
  String get close;

  /// No description provided for @retry.
  ///
  /// In id, this message translates to:
  /// **'Coba lagi'**
  String get retry;

  /// Under a failure: the request ID to quote to support.
  ///
  /// In id, this message translates to:
  /// **'Kode referensi: {id}'**
  String errorRequestId(String id);

  /// names: menus, listed as the language lists them.
  ///
  /// In id, this message translates to:
  /// **'Harga {names} berubah.'**
  String changedPrices(String names);

  /// No description provided for @changedUnavailable.
  ///
  /// In id, this message translates to:
  /// **'{names} tidak dijual lagi, jadi dihapus dari pesanan.'**
  String changedUnavailable(String names);

  /// No description provided for @changedStock.
  ///
  /// In id, this message translates to:
  /// **'Stok {names} tidak cukup lagi, jadi jumlahnya disesuaikan.'**
  String changedStock(String names);

  /// No description provided for @changedTotal.
  ///
  /// In id, this message translates to:
  /// **'Pajak, service charge, atau syarat voucher berubah.'**
  String get changedTotal;

  /// No description provided for @changedMethod.
  ///
  /// In id, this message translates to:
  /// **'Metode bayar ini tidak tersedia.'**
  String get changedMethod;

  /// No description provided for @changedCheck.
  ///
  /// In id, this message translates to:
  /// **'Periksa pesanan dan totalnya, lalu tagih lagi.'**
  String get changedCheck;

  /// No description provided for @changedClock.
  ///
  /// In id, this message translates to:
  /// **'Jam HP ini tidak sesuai. Periksa tanggal dan jam di pengaturan HP, lalu tagih lagi.'**
  String get changedClock;

  /// The last two names of a list: Kopi dan Teh.
  ///
  /// In id, this message translates to:
  /// **'{first} dan {last}'**
  String listAnd(String first, String last);

  /// No description provided for @doneTitle.
  ///
  /// In id, this message translates to:
  /// **'Transaksi tersimpan'**
  String get doneTitle;

  /// No description provided for @doneChange.
  ///
  /// In id, this message translates to:
  /// **'Kembalian {amount}'**
  String doneChange(String amount);

  /// No description provided for @doneNew.
  ///
  /// In id, this message translates to:
  /// **'Transaksi baru'**
  String get doneNew;

  /// No description provided for @receiptLabel.
  ///
  /// In id, this message translates to:
  /// **'Struk {number}'**
  String receiptLabel(String number);

  /// No description provided for @receiptNumber.
  ///
  /// In id, this message translates to:
  /// **'No. struk'**
  String get receiptNumber;

  /// No description provided for @receiptDate.
  ///
  /// In id, this message translates to:
  /// **'Waktu'**
  String get receiptDate;

  /// No description provided for @receiptCashier.
  ///
  /// In id, this message translates to:
  /// **'Kasir'**
  String get receiptCashier;

  /// No description provided for @receiptType.
  ///
  /// In id, this message translates to:
  /// **'Tipe'**
  String get receiptType;

  /// No description provided for @receiptService.
  ///
  /// In id, this message translates to:
  /// **'Service {rate}'**
  String receiptService(String rate);

  /// No description provided for @receiptTax.
  ///
  /// In id, this message translates to:
  /// **'Pajak {rate}'**
  String receiptTax(String rate);

  /// No description provided for @receiptChange.
  ///
  /// In id, this message translates to:
  /// **'Kembalian'**
  String get receiptChange;

  /// No description provided for @receiptVoid.
  ///
  /// In id, this message translates to:
  /// **'VOID'**
  String get receiptVoid;

  /// No description provided for @receiptVoidReason.
  ///
  /// In id, this message translates to:
  /// **'Alasan: {reason}'**
  String receiptVoidReason(String reason);

  /// No description provided for @receiptThanks.
  ///
  /// In id, this message translates to:
  /// **'Terima kasih'**
  String get receiptThanks;

  /// No description provided for @deviceNotRegisteredTitle.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini belum terdaftar'**
  String get deviceNotRegisteredTitle;

  /// No description provided for @deviceNotRegisteredBody.
  ///
  /// In id, this message translates to:
  /// **'Kasir hanya bisa dipakai di perangkat yang sudah diaktifkan untuk {outlet}. Minta Manager masuk di HP ini untuk mengaktifkannya.'**
  String deviceNotRegisteredBody(String outlet);

  /// No description provided for @deviceNotRegisteredManager.
  ///
  /// In id, this message translates to:
  /// **'Beri nama HP ini, lalu aktifkan sebagai kasir {outlet}. Kodenya dipakai di setiap nomor struk dari HP ini.'**
  String deviceNotRegisteredManager(String outlet);

  /// No description provided for @deviceName.
  ///
  /// In id, this message translates to:
  /// **'Nama perangkat'**
  String get deviceName;

  /// No description provided for @deviceNameHint.
  ///
  /// In id, this message translates to:
  /// **'Misalnya Kasir depan. Paling banyak 50 karakter.'**
  String get deviceNameHint;

  /// No description provided for @deviceActivate.
  ///
  /// In id, this message translates to:
  /// **'Aktifkan perangkat ini'**
  String get deviceActivate;

  /// No description provided for @deviceActivating.
  ///
  /// In id, this message translates to:
  /// **'Mengaktifkan…'**
  String get deviceActivating;

  /// No description provided for @deviceCheckFailed.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini tidak bisa diperiksa.'**
  String get deviceCheckFailed;

  /// No description provided for @historyTitle.
  ///
  /// In id, this message translates to:
  /// **'Riwayat hari ini'**
  String get historyTitle;

  /// No description provided for @historySearch.
  ///
  /// In id, this message translates to:
  /// **'Cari nomor struk'**
  String get historySearch;

  /// No description provided for @historySearchHint.
  ///
  /// In id, this message translates to:
  /// **'Misalnya 0012'**
  String get historySearchHint;

  /// No description provided for @historyPaid.
  ///
  /// In id, this message translates to:
  /// **'Lunas'**
  String get historyPaid;

  /// No description provided for @historyVoid.
  ///
  /// In id, this message translates to:
  /// **'Void'**
  String get historyVoid;

  /// No description provided for @historyEmpty.
  ///
  /// In id, this message translates to:
  /// **'Belum ada transaksi hari ini.'**
  String get historyEmpty;

  /// No description provided for @historyNoMatch.
  ///
  /// In id, this message translates to:
  /// **'Tidak ada transaksi hari ini dengan nomor itu.'**
  String get historyNoMatch;

  /// No description provided for @historyItems.
  ///
  /// In id, this message translates to:
  /// **'{count} item'**
  String historyItems(int count);

  /// No description provided for @historyMore.
  ///
  /// In id, this message translates to:
  /// **'Muat lebih banyak'**
  String get historyMore;

  /// No description provided for @historyLoadFailed.
  ///
  /// In id, this message translates to:
  /// **'Riwayat tidak bisa dimuat.'**
  String get historyLoadFailed;

  /// No description provided for @orderTitle.
  ///
  /// In id, this message translates to:
  /// **'Detail transaksi'**
  String get orderTitle;

  /// No description provided for @orderLoadFailed.
  ///
  /// In id, this message translates to:
  /// **'Transaksi ini tidak bisa dimuat.'**
  String get orderLoadFailed;

  /// No description provided for @voidAction.
  ///
  /// In id, this message translates to:
  /// **'Void transaksi'**
  String get voidAction;

  /// No description provided for @voidTitle.
  ///
  /// In id, this message translates to:
  /// **'Void transaksi {number}?'**
  String voidTitle(String number);

  /// No description provided for @voidBody.
  ///
  /// In id, this message translates to:
  /// **'Transaksi dan pembayarannya dibatalkan, dan stoknya kembali. Tidak bisa diurungkan.'**
  String get voidBody;

  /// No description provided for @voidReason.
  ///
  /// In id, this message translates to:
  /// **'Alasan'**
  String get voidReason;

  /// No description provided for @voidReasonHint.
  ///
  /// In id, this message translates to:
  /// **'Wajib, paling banyak 200 karakter.'**
  String get voidReasonHint;

  /// No description provided for @voidConfirm.
  ///
  /// In id, this message translates to:
  /// **'Void'**
  String get voidConfirm;

  /// No description provided for @voidDone.
  ///
  /// In id, this message translates to:
  /// **'Transaksi {number} sudah di-void.'**
  String voidDone(String number);

  /// No description provided for @accountTitle.
  ///
  /// In id, this message translates to:
  /// **'Akun'**
  String get accountTitle;

  /// No description provided for @accountSignedIn.
  ///
  /// In id, this message translates to:
  /// **'Masuk sebagai'**
  String get accountSignedIn;

  /// No description provided for @accountOutlet.
  ///
  /// In id, this message translates to:
  /// **'Outlet'**
  String get accountOutlet;

  /// No description provided for @accountDevice.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini'**
  String get accountDevice;

  /// No description provided for @accountDeviceNone.
  ///
  /// In id, this message translates to:
  /// **'Belum diaktifkan sebagai kasir'**
  String get accountDeviceNone;

  /// No description provided for @accountToday.
  ///
  /// In id, this message translates to:
  /// **'Hari ini di outlet'**
  String get accountToday;

  /// No description provided for @signOutConfirmTitle.
  ///
  /// In id, this message translates to:
  /// **'Keluar dari kasir?'**
  String get signOutConfirmTitle;

  /// No description provided for @signOutConfirmBody.
  ///
  /// In id, this message translates to:
  /// **'Pesanan yang sedang dibuat akan hilang.'**
  String get signOutConfirmBody;

  /// No description provided for @apiErrorForbidden.
  ///
  /// In id, this message translates to:
  /// **'Anda tidak punya izin untuk melakukan ini.'**
  String get apiErrorForbidden;

  /// No description provided for @apiErrorOutletNotFound.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini tidak ada, atau Anda tidak punya akses ke outlet ini.'**
  String get apiErrorOutletNotFound;

  /// No description provided for @apiErrorOutletInactive.
  ///
  /// In id, this message translates to:
  /// **'Outlet Anda sedang dinonaktifkan. Hubungi Owner.'**
  String get apiErrorOutletInactive;

  /// No description provided for @apiErrorDeviceNotRegistered.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini belum terdaftar sebagai kasir outlet ini. Minta Manager masuk di HP ini untuk mengaktifkannya.'**
  String get apiErrorDeviceNotRegistered;

  /// No description provided for @apiErrorDeviceRevoked.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini sudah dicabut, jadi tidak bisa bertransaksi.'**
  String get apiErrorDeviceRevoked;

  /// No description provided for @apiErrorDeviceAlreadyActive.
  ///
  /// In id, this message translates to:
  /// **'Perangkat ini sudah aktif sebagai kasir outlet ini.'**
  String get apiErrorDeviceAlreadyActive;

  /// No description provided for @apiErrorOrderNotFound.
  ///
  /// In id, this message translates to:
  /// **'Transaksi ini tidak ada di outlet ini.'**
  String get apiErrorOrderNotFound;

  /// No description provided for @apiErrorOrderAlreadyVoid.
  ///
  /// In id, this message translates to:
  /// **'Transaksi ini sudah di-void.'**
  String get apiErrorOrderAlreadyVoid;

  /// No description provided for @apiErrorOrderIdConflict.
  ///
  /// In id, this message translates to:
  /// **'ID ini sudah dipakai transaksi lain. Ulangi pesanannya dari awal.'**
  String get apiErrorOrderIdConflict;

  /// No description provided for @apiErrorOrderNoTaken.
  ///
  /// In id, this message translates to:
  /// **'Nomor struk ini sudah dipakai. Tagih lagi untuk memakai nomor berikutnya.'**
  String get apiErrorOrderNoTaken;

  /// No description provided for @noAccessTitle.
  ///
  /// In id, this message translates to:
  /// **'Belum ada akses kasir'**
  String get noAccessTitle;

  /// No description provided for @noAccessBody.
  ///
  /// In id, this message translates to:
  /// **'Role Anda di {outlet} belum mengizinkan transaksi di kasir. Minta Manager outlet menambahkan izin itu, lalu periksa lagi.'**
  String noAccessBody(String outlet);

  /// No description provided for @noAccessOwnerTitle.
  ///
  /// In id, this message translates to:
  /// **'Aplikasi ini untuk kasir'**
  String get noAccessOwnerTitle;

  /// No description provided for @noAccessOwnerBody.
  ///
  /// In id, this message translates to:
  /// **'Akun Owner dipakai di web admin Maki. Aplikasi Android ini untuk Manager dan staf yang bertransaksi di kasir.'**
  String get noAccessOwnerBody;

  /// No description provided for @noAccessSignedInAs.
  ///
  /// In id, this message translates to:
  /// **'Masuk sebagai {name} (@{username})'**
  String noAccessSignedInAs(String name, String username);

  /// No description provided for @noAccessCheckAgain.
  ///
  /// In id, this message translates to:
  /// **'Periksa lagi'**
  String get noAccessCheckAgain;

  /// No description provided for @noAccessUnchanged.
  ///
  /// In id, this message translates to:
  /// **'Akses Anda belum berubah.'**
  String get noAccessUnchanged;

  /// No description provided for @apiErrorInternal.
  ///
  /// In id, this message translates to:
  /// **'Terjadi kesalahan di server. Coba lagi.'**
  String get apiErrorInternal;

  /// No description provided for @apiErrorNotFound.
  ///
  /// In id, this message translates to:
  /// **'Data tidak ditemukan.'**
  String get apiErrorNotFound;

  /// No description provided for @apiErrorNotReady.
  ///
  /// In id, this message translates to:
  /// **'Layanan sedang tidak tersedia. Coba lagi sebentar lagi.'**
  String get apiErrorNotReady;

  /// No description provided for @apiErrorNetwork.
  ///
  /// In id, this message translates to:
  /// **'Tidak bisa terhubung ke server. Periksa koneksi internet.'**
  String get apiErrorNetwork;

  /// No description provided for @apiErrorInvalidCredentials.
  ///
  /// In id, this message translates to:
  /// **'Username atau password salah.'**
  String get apiErrorInvalidCredentials;

  /// No description provided for @apiErrorAccountDisabled.
  ///
  /// In id, this message translates to:
  /// **'Akun ini dinonaktifkan. Hubungi Manager atau Owner.'**
  String get apiErrorAccountDisabled;

  /// No description provided for @apiErrorRateLimited.
  ///
  /// In id, this message translates to:
  /// **'{minutes, plural, other{Terlalu banyak percobaan. Coba lagi dalam {minutes} menit.}}'**
  String apiErrorRateLimited(int minutes);

  /// No description provided for @apiErrorWrongPassword.
  ///
  /// In id, this message translates to:
  /// **'Password saat ini salah.'**
  String get apiErrorWrongPassword;

  /// No description provided for @apiErrorPasswordTooShort.
  ///
  /// In id, this message translates to:
  /// **'Password minimal {min} karakter.'**
  String apiErrorPasswordTooShort(int min);

  /// No description provided for @apiErrorPasswordTooLong.
  ///
  /// In id, this message translates to:
  /// **'Password maksimal {max} karakter.'**
  String apiErrorPasswordTooLong(int max);

  /// No description provided for @apiErrorPasswordSameAsUsername.
  ///
  /// In id, this message translates to:
  /// **'Password tidak boleh sama dengan username.'**
  String get apiErrorPasswordSameAsUsername;

  /// No description provided for @apiErrorUnauthorized.
  ///
  /// In id, this message translates to:
  /// **'Sesi Anda sudah berakhir. Silakan masuk lagi.'**
  String get apiErrorUnauthorized;

  /// No description provided for @apiErrorValidation.
  ///
  /// In id, this message translates to:
  /// **'Periksa lagi isian yang ditandai.'**
  String get apiErrorValidation;

  /// No description provided for @voucherLabel.
  ///
  /// In id, this message translates to:
  /// **'Voucher'**
  String get voucherLabel;

  /// No description provided for @voucherHint.
  ///
  /// In id, this message translates to:
  /// **'Kode voucher'**
  String get voucherHint;

  /// No description provided for @voucherApply.
  ///
  /// In id, this message translates to:
  /// **'Pakai'**
  String get voucherApply;

  /// No description provided for @voucherChecking.
  ///
  /// In id, this message translates to:
  /// **'Memeriksa…'**
  String get voucherChecking;

  /// No description provided for @voucherRemove.
  ///
  /// In id, this message translates to:
  /// **'Lepas voucher {code}'**
  String voucherRemove(String code);

  /// No description provided for @voucherMinSpend.
  ///
  /// In id, this message translates to:
  /// **'Belanja minimal {amount} untuk voucher ini. Tambah pesanan atau lepas vouchernya.'**
  String voucherMinSpend(String amount);

  /// No description provided for @voucherRemoved.
  ///
  /// In id, this message translates to:
  /// **'Voucher {code} dilepas: {reason}'**
  String voucherRemoved(String code, String reason);

  /// No description provided for @summaryVoucher.
  ///
  /// In id, this message translates to:
  /// **'Potongan ({code})'**
  String summaryVoucher(String code);

  /// No description provided for @apiErrorVoucherNotFound.
  ///
  /// In id, this message translates to:
  /// **'Tidak ada voucher dengan kode ini.'**
  String get apiErrorVoucherNotFound;

  /// No description provided for @apiErrorVoucherInactive.
  ///
  /// In id, this message translates to:
  /// **'Voucher ini sedang nonaktif.'**
  String get apiErrorVoucherInactive;

  /// No description provided for @apiErrorVoucherNotStarted.
  ///
  /// In id, this message translates to:
  /// **'Voucher ini belum berlaku.'**
  String get apiErrorVoucherNotStarted;

  /// No description provided for @apiErrorVoucherExpired.
  ///
  /// In id, this message translates to:
  /// **'Voucher ini sudah expired.'**
  String get apiErrorVoucherExpired;

  /// No description provided for @apiErrorVoucherUsedUp.
  ///
  /// In id, this message translates to:
  /// **'Kuota voucher ini sudah habis.'**
  String get apiErrorVoucherUsedUp;

  /// No description provided for @apiErrorVoucherNotForOutlet.
  ///
  /// In id, this message translates to:
  /// **'Voucher ini tidak berlaku di outlet ini.'**
  String get apiErrorVoucherNotForOutlet;

  /// No description provided for @apiErrorVoucherMinSpend.
  ///
  /// In id, this message translates to:
  /// **'Belanja belum mencapai minimal belanja voucher ini.'**
  String get apiErrorVoucherMinSpend;

  /// Bottom navigation and rail: the outlet's tables, when it has some.
  ///
  /// In id, this message translates to:
  /// **'Meja'**
  String get navTables;

  /// No description provided for @tablesTitle.
  ///
  /// In id, this message translates to:
  /// **'Meja'**
  String get tablesTitle;

  /// No description provided for @tablesIntro.
  ///
  /// In id, this message translates to:
  /// **'Pilih meja untuk melihat statusnya, memesan di sana, atau mengosongkannya setelah customer pergi.'**
  String get tablesIntro;

  /// No description provided for @tablesEmpty.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini belum punya meja. Manager menambahkannya di halaman Meja admin.'**
  String get tablesEmpty;

  /// No description provided for @tablesLoadFailed.
  ///
  /// In id, this message translates to:
  /// **'Meja belum bisa dimuat.'**
  String get tablesLoadFailed;

  /// No description provided for @tableLegend.
  ///
  /// In id, this message translates to:
  /// **'Keterangan:'**
  String get tableLegend;

  /// No description provided for @tableStatusAvailable.
  ///
  /// In id, this message translates to:
  /// **'Tersedia'**
  String get tableStatusAvailable;

  /// No description provided for @tableStatusOccupied.
  ///
  /// In id, this message translates to:
  /// **'Terisi'**
  String get tableStatusOccupied;

  /// No description provided for @tableStatusInactive.
  ///
  /// In id, this message translates to:
  /// **'Nonaktif'**
  String get tableStatusInactive;

  /// No description provided for @tableStatusScheduled.
  ///
  /// In id, this message translates to:
  /// **'Nonaktif terjadwal'**
  String get tableStatusScheduled;

  /// No description provided for @decorationWall.
  ///
  /// In id, this message translates to:
  /// **'Dinding'**
  String get decorationWall;

  /// No description provided for @decorationCashier.
  ///
  /// In id, this message translates to:
  /// **'Kasir'**
  String get decorationCashier;

  /// No description provided for @decorationDoor.
  ///
  /// In id, this message translates to:
  /// **'Pintu'**
  String get decorationDoor;

  /// No description provided for @tableSeats.
  ///
  /// In id, this message translates to:
  /// **'{count} kursi'**
  String tableSeats(int count);

  /// A table on the layout, for screen readers.
  ///
  /// In id, this message translates to:
  /// **'Meja {name}, {status}'**
  String tableLabel(String name, String status);

  /// A table on the layout with its seats, for screen readers.
  ///
  /// In id, this message translates to:
  /// **'Meja {name}, {status}, {seats}'**
  String tableLabelSeats(String name, String status, String seats);

  /// The layout, for screen readers.
  ///
  /// In id, this message translates to:
  /// **'Layout area {area}'**
  String tableLayout(String area);

  /// No description provided for @tableUnplaced.
  ///
  /// In id, this message translates to:
  /// **'Belum ditempatkan di layout:'**
  String get tableUnplaced;

  /// No description provided for @tableDetailTitle.
  ///
  /// In id, this message translates to:
  /// **'Meja {name}'**
  String tableDetailTitle(String name);

  /// No description provided for @tableSeatsTerm.
  ///
  /// In id, this message translates to:
  /// **'Kursi'**
  String get tableSeatsTerm;

  /// No description provided for @tableNoSeats.
  ///
  /// In id, this message translates to:
  /// **'Tidak diisi'**
  String get tableNoSeats;

  /// No description provided for @tableSince.
  ///
  /// In id, this message translates to:
  /// **'Terisi sejak'**
  String get tableSince;

  /// No description provided for @tableOrders.
  ///
  /// In id, this message translates to:
  /// **'Transaksi'**
  String get tableOrders;

  /// No description provided for @tableInactiveNote.
  ///
  /// In id, this message translates to:
  /// **'Meja ini sedang dinonaktifkan Manager, jadi tidak bisa dipilih.'**
  String get tableInactiveNote;

  /// No description provided for @tableScheduledNote.
  ///
  /// In id, this message translates to:
  /// **'Meja ini sedang nonaktif terjadwal, jadi tidak bisa dipilih.'**
  String get tableScheduledNote;

  /// No description provided for @tableOrderHere.
  ///
  /// In id, this message translates to:
  /// **'Pesan di meja ini'**
  String get tableOrderHere;

  /// No description provided for @tablePendingHint.
  ///
  /// In id, this message translates to:
  /// **'Transaksi sebelumnya belum terjawab. Selesaikan dulu di Detail Items.'**
  String get tablePendingHint;

  /// No description provided for @tableRelease.
  ///
  /// In id, this message translates to:
  /// **'Kosongkan Meja'**
  String get tableRelease;

  /// No description provided for @tableReleaseTitle.
  ///
  /// In id, this message translates to:
  /// **'Kosongkan meja {name}?'**
  String tableReleaseTitle(String name);

  /// No description provided for @tableReleaseBody.
  ///
  /// In id, this message translates to:
  /// **'Lakukan setelah customer meninggalkan meja. Meja jadi tersedia lagi untuk customer berikutnya.'**
  String get tableReleaseBody;

  /// No description provided for @tableReleased.
  ///
  /// In id, this message translates to:
  /// **'Meja {name} dikosongkan.'**
  String tableReleased(String name);

  /// No description provided for @tablePickTitle.
  ///
  /// In id, this message translates to:
  /// **'Pilih meja'**
  String get tablePickTitle;

  /// No description provided for @tablePickIntro.
  ///
  /// In id, this message translates to:
  /// **'Meja yang tersedia atau terisi bisa dipilih. Pesanan tambahan di meja yang sama jadi transaksi baru.'**
  String get tablePickIntro;

  /// Detail Items: picks a dine-in order's table.
  ///
  /// In id, this message translates to:
  /// **'Pilih meja'**
  String get tablePick;

  /// No description provided for @tablePickOptional.
  ///
  /// In id, this message translates to:
  /// **'Opsional'**
  String get tablePickOptional;

  /// Detail Items: the order's table.
  ///
  /// In id, this message translates to:
  /// **'Meja {name}'**
  String tableChosen(String name);

  /// No description provided for @tableChange.
  ///
  /// In id, this message translates to:
  /// **'Ganti'**
  String get tableChange;

  /// No description provided for @tableLetGo.
  ///
  /// In id, this message translates to:
  /// **'Lepas meja {name}'**
  String tableLetGo(String name);

  /// No description provided for @tableRemoved.
  ///
  /// In id, this message translates to:
  /// **'Meja {name} dilepas dari pesanan: {reason}'**
  String tableRemoved(String name, String reason);

  /// No description provided for @tableUnavailableInactive.
  ///
  /// In id, this message translates to:
  /// **'mejanya sedang dinonaktifkan.'**
  String get tableUnavailableInactive;

  /// No description provided for @tableUnavailableScheduled.
  ///
  /// In id, this message translates to:
  /// **'mejanya sedang nonaktif terjadwal.'**
  String get tableUnavailableScheduled;

  /// No description provided for @tableUnavailableMissing.
  ///
  /// In id, this message translates to:
  /// **'mejanya sudah dihapus.'**
  String get tableUnavailableMissing;

  /// No description provided for @receiptTable.
  ///
  /// In id, this message translates to:
  /// **'Meja'**
  String get receiptTable;

  /// Today's orders: an order's table.
  ///
  /// In id, this message translates to:
  /// **'Meja {name}'**
  String historyTable(String name);

  /// No description provided for @apiErrorTableUnavailable.
  ///
  /// In id, this message translates to:
  /// **'Meja ini sedang tidak bisa dipilih.'**
  String get apiErrorTableUnavailable;

  /// No description provided for @apiErrorTableNotFound.
  ///
  /// In id, this message translates to:
  /// **'Meja tidak ditemukan.'**
  String get apiErrorTableNotFound;

  /// No description provided for @standLabel.
  ///
  /// In id, this message translates to:
  /// **'Nomor papan'**
  String get standLabel;

  /// No description provided for @standPlaceholder.
  ///
  /// In id, this message translates to:
  /// **'Misalnya 12'**
  String get standPlaceholder;

  /// No description provided for @standHint.
  ///
  /// In id, this message translates to:
  /// **'Wajib untuk dine-in: nomor yang tertulis di papan tamu.'**
  String get standHint;

  /// No description provided for @standFormat.
  ///
  /// In id, this message translates to:
  /// **'1–10 huruf, angka atau tanda hubung, misalnya 12, A5 atau B-3.'**
  String get standFormat;

  /// The outlet turned to number stands: the table picked came off the order.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini sekarang memakai Mode Nomor, jadi meja {name} dilepas dari pesanan. Isi nomor papan tamu.'**
  String standTableDropped(String name);

  /// The outlet turned back to tables: the stand's number came off the order.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini sekarang memakai Mode Meja, jadi nomor papan {number} dilepas dari pesanan.'**
  String standDropped(String number);

  /// No description provided for @standNowNumber.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini sekarang memakai Mode Nomor. Isi nomor papan tamu.'**
  String get standNowNumber;

  /// No description provided for @receiptStand.
  ///
  /// In id, this message translates to:
  /// **'Nomor papan'**
  String get receiptStand;

  /// Today's orders: the number on an order's stand.
  ///
  /// In id, this message translates to:
  /// **'No. {number}'**
  String historyStand(String number);

  /// No description provided for @tablesNumberMode.
  ///
  /// In id, this message translates to:
  /// **'Outlet ini memakai Mode Nomor: tamu dine-in membawa papan nomor, dan kasir mengetik nomornya di Detail Items, tanpa memilih meja.'**
  String get tablesNumberMode;

  /// No description provided for @apiErrorDineInModeChanged.
  ///
  /// In id, this message translates to:
  /// **'Cara outlet ini mencatat tempat tamu dine-in baru saja berubah: di meja, atau dengan nomor papan.'**
  String get apiErrorDineInModeChanged;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
