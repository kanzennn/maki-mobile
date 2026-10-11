// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Maki';

  @override
  String get loginTitle => 'Masuk';

  @override
  String get loginSubtitle => 'Masuk dengan username dan password Anda.';

  @override
  String get usernameLabel => 'Username';

  @override
  String get passwordLabel => 'Password';

  @override
  String get loginSubmit => 'Masuk';

  @override
  String get loginForgotHint =>
      'Lupa password? Minta Manager atau Owner mereset password Anda.';

  @override
  String get loginDeviceRevoked =>
      'Perangkat ini sudah dicabut dari kasir outlet, jadi Anda dikeluarkan. Untuk memakainya lagi, Manager masuk di perangkat ini lalu mengaktifkannya sebagai perangkat baru.';

  @override
  String get validationRequired => 'Wajib diisi.';

  @override
  String validationMinLength(int min) {
    return 'Minimal $min karakter.';
  }

  @override
  String validationMaxLength(int max) {
    return 'Maksimal $max karakter.';
  }

  @override
  String get validationMismatch => 'Password tidak sama.';

  @override
  String get changePasswordTitle => 'Ganti password';

  @override
  String get changePasswordRequired =>
      'Password Anda dibuat oleh orang lain. Buat password Anda sendiri sebelum melanjutkan.';

  @override
  String get currentPasswordLabel => 'Password saat ini';

  @override
  String get newPasswordLabel => 'Password baru';

  @override
  String get confirmPasswordLabel => 'Ulangi password baru';

  @override
  String get changePasswordSubmit => 'Simpan password';

  @override
  String get changePasswordDone =>
      'Password sudah diganti. Perangkat lain yang masuk dengan akun ini sudah dikeluarkan.';

  @override
  String get signOut => 'Keluar';

  @override
  String get navCashier => 'Kasir';

  @override
  String get navHistory => 'Riwayat';

  @override
  String get navAccount => 'Akun';

  @override
  String get posMenuHeading => 'Pilih menu';

  @override
  String posDevice(String code, String name) {
    return '$code · $name';
  }

  @override
  String get posSearchLabel => 'Cari menu';

  @override
  String get posClearSearch => 'Hapus pencarian';

  @override
  String get posCategories => 'Kategori';

  @override
  String get posAllMenus => 'Semua menu';

  @override
  String posCategoryItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString item';
  }

  @override
  String posStockAvailable(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Tersedia $countString';
  }

  @override
  String get posStockAlways => 'Selalu tersedia';

  @override
  String get posStockOut => 'Habis';

  @override
  String get posStockLow => 'Stok menipis';

  @override
  String posInCart(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString di pesanan';
  }

  @override
  String get posMenusNone =>
      'Belum ada menu yang dijual. Manager menambahkannya di halaman Menu di web admin.';

  @override
  String get posMenusNoMatch => 'Tidak ada menu yang cocok.';

  @override
  String get posLoadFailed => 'Menu kasir tidak bisa dimuat.';

  @override
  String get cartTitle => 'Detail Items';

  @override
  String cartItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString item';
  }

  @override
  String get cartEmpty => 'Belum ada pesanan. Pilih menu untuk mulai.';

  @override
  String get cartType => 'Tipe pesanan';

  @override
  String get orderTypeDineIn => 'Dine-in';

  @override
  String get orderTypeTakeaway => 'Takeaway';

  @override
  String cartLess(String name) {
    return 'Kurangi $name';
  }

  @override
  String cartMore(String name) {
    return 'Tambah $name';
  }

  @override
  String cartRemove(String name) {
    return 'Hapus $name';
  }

  @override
  String get cartNote => 'Catatan';

  @override
  String cartNoteFor(String name) {
    return 'Catatan untuk $name';
  }

  @override
  String get cartNoteHint => 'Misalnya less sugar';

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

    return 'Sisa stok $countString';
  }

  @override
  String get summaryItems => 'Item';

  @override
  String get summarySubtotal => 'Subtotal';

  @override
  String get summaryDiscount => 'Potongan';

  @override
  String summaryService(String rate) {
    return 'Service ($rate)';
  }

  @override
  String summaryTax(String rate) {
    return 'Pajak ($rate)';
  }

  @override
  String get summaryTotal => 'Total';

  @override
  String get cartMethod => 'Metode bayar';

  @override
  String get methodCash => 'Tunai';

  @override
  String get methodQris => 'QRIS';

  @override
  String get methodDebit => 'Debit';

  @override
  String get cartSoon => 'Segera hadir';

  @override
  String cartPay(String total) {
    return 'Bayar $total';
  }

  @override
  String get cartView => 'Lihat pesanan';

  @override
  String get cartLocked =>
      'Transaksi sebelumnya belum terjawab. Selesaikan dulu sebelum mengubah pesanan.';

  @override
  String cartTooMuch(String amount) {
    return 'Total pesanan paling banyak $amount.';
  }

  @override
  String get cartNoCash => 'Outlet ini sedang tidak menerima tunai.';

  @override
  String get payTitle => 'Bayar tunai';

  @override
  String get payTotal => 'Total';

  @override
  String get payReceived => 'Uang diterima';

  @override
  String get payQuick => 'Nominal cepat';

  @override
  String get payExact => 'Uang pas';

  @override
  String get payChange => 'Kembalian';

  @override
  String payShort(String amount) {
    return 'Kurang $amount';
  }

  @override
  String get payConfirm => 'Bayar';

  @override
  String get paySending => 'Menyimpan…';

  @override
  String get payUnknown =>
      'Server belum menjawab, jadi transaksi ini mungkin sudah tersimpan. Kirim ulang: transaksi yang sama tidak akan tercatat dua kali.';

  @override
  String get payResend => 'Kirim ulang';

  @override
  String get payAbandon => 'Batalkan transaksi ini';

  @override
  String get payAbandonWarning =>
      'Pesanan bisa diubah lagi. Periksa Riwayat sebelum menagih lagi: transaksi ini mungkin sudah tersimpan.';

  @override
  String get cancel => 'Batal';

  @override
  String get close => 'Tutup';

  @override
  String get retry => 'Coba lagi';

  @override
  String errorRequestId(String id) {
    return 'Kode referensi: $id';
  }

  @override
  String changedPrices(String names) {
    return 'Harga $names berubah.';
  }

  @override
  String changedUnavailable(String names) {
    return '$names tidak dijual lagi, jadi dihapus dari pesanan.';
  }

  @override
  String changedStock(String names) {
    return 'Stok $names tidak cukup lagi, jadi jumlahnya disesuaikan.';
  }

  @override
  String get changedTotal =>
      'Pajak, service charge, atau syarat voucher berubah.';

  @override
  String get changedMethod => 'Metode bayar ini tidak tersedia.';

  @override
  String get changedCheck => 'Periksa pesanan dan totalnya, lalu tagih lagi.';

  @override
  String get changedClock =>
      'Jam HP ini tidak sesuai. Periksa tanggal dan jam di pengaturan HP, lalu tagih lagi.';

  @override
  String listAnd(String first, String last) {
    return '$first dan $last';
  }

  @override
  String get doneTitle => 'Transaksi tersimpan';

  @override
  String doneChange(String amount) {
    return 'Kembalian $amount';
  }

  @override
  String get doneNew => 'Transaksi baru';

  @override
  String receiptLabel(String number) {
    return 'Struk $number';
  }

  @override
  String get receiptNumber => 'No. struk';

  @override
  String get receiptDate => 'Waktu';

  @override
  String get receiptCashier => 'Kasir';

  @override
  String get receiptType => 'Tipe';

  @override
  String receiptService(String rate) {
    return 'Service $rate';
  }

  @override
  String receiptTax(String rate) {
    return 'Pajak $rate';
  }

  @override
  String get receiptChange => 'Kembalian';

  @override
  String get receiptVoid => 'VOID';

  @override
  String receiptVoidReason(String reason) {
    return 'Alasan: $reason';
  }

  @override
  String get receiptThanks => 'Terima kasih';

  @override
  String get deviceNotRegisteredTitle => 'Perangkat ini belum terdaftar';

  @override
  String deviceNotRegisteredBody(String outlet) {
    return 'Kasir hanya bisa dipakai di perangkat yang sudah diaktifkan untuk $outlet. Minta Manager masuk di HP ini untuk mengaktifkannya.';
  }

  @override
  String deviceNotRegisteredManager(String outlet) {
    return 'Beri nama HP ini, lalu aktifkan sebagai kasir $outlet. Kodenya dipakai di setiap nomor struk dari HP ini.';
  }

  @override
  String get deviceName => 'Nama perangkat';

  @override
  String get deviceNameHint =>
      'Misalnya Kasir depan. Paling banyak 50 karakter.';

  @override
  String get deviceActivate => 'Aktifkan perangkat ini';

  @override
  String get deviceActivating => 'Mengaktifkan…';

  @override
  String get deviceCheckFailed => 'Perangkat ini tidak bisa diperiksa.';

  @override
  String get historyTitle => 'Riwayat hari ini';

  @override
  String get historySearch => 'Cari nomor struk';

  @override
  String get historySearchHint => 'Misalnya 0012';

  @override
  String get historyPaid => 'Lunas';

  @override
  String get historyVoid => 'Void';

  @override
  String get historyEmpty => 'Belum ada transaksi hari ini.';

  @override
  String get historyNoMatch => 'Tidak ada transaksi hari ini dengan nomor itu.';

  @override
  String historyItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString item';
  }

  @override
  String get historyMore => 'Muat lebih banyak';

  @override
  String get historyLoadFailed => 'Riwayat tidak bisa dimuat.';

  @override
  String get orderTitle => 'Detail transaksi';

  @override
  String get orderLoadFailed => 'Transaksi ini tidak bisa dimuat.';

  @override
  String get voidAction => 'Void transaksi';

  @override
  String voidTitle(String number) {
    return 'Void transaksi $number?';
  }

  @override
  String get voidBody =>
      'Transaksi dan pembayarannya dibatalkan, dan stoknya kembali. Tidak bisa diurungkan.';

  @override
  String get voidReason => 'Alasan';

  @override
  String get voidReasonHint => 'Wajib, paling banyak 200 karakter.';

  @override
  String get voidConfirm => 'Void';

  @override
  String voidDone(String number) {
    return 'Transaksi $number sudah di-void.';
  }

  @override
  String get accountTitle => 'Akun';

  @override
  String get accountSignedIn => 'Masuk sebagai';

  @override
  String get accountOutlet => 'Outlet';

  @override
  String get accountDevice => 'Perangkat ini';

  @override
  String get accountDeviceNone => 'Belum diaktifkan sebagai kasir';

  @override
  String get accountToday => 'Hari ini di outlet';

  @override
  String get signOutConfirmTitle => 'Keluar dari kasir?';

  @override
  String get signOutConfirmBody => 'Pesanan yang sedang dibuat akan hilang.';

  @override
  String get apiErrorForbidden => 'Anda tidak punya izin untuk melakukan ini.';

  @override
  String get apiErrorOutletNotFound =>
      'Outlet ini tidak ada, atau Anda tidak punya akses ke outlet ini.';

  @override
  String get apiErrorOutletInactive =>
      'Outlet Anda sedang dinonaktifkan. Hubungi Owner.';

  @override
  String get apiErrorDeviceNotRegistered =>
      'Perangkat ini belum terdaftar sebagai kasir outlet ini. Minta Manager masuk di HP ini untuk mengaktifkannya.';

  @override
  String get apiErrorDeviceRevoked =>
      'Perangkat ini sudah dicabut, jadi tidak bisa bertransaksi.';

  @override
  String get apiErrorDeviceAlreadyActive =>
      'Perangkat ini sudah aktif sebagai kasir outlet ini.';

  @override
  String get apiErrorOrderNotFound => 'Transaksi ini tidak ada di outlet ini.';

  @override
  String get apiErrorOrderAlreadyVoid => 'Transaksi ini sudah di-void.';

  @override
  String get apiErrorOrderIdConflict =>
      'ID ini sudah dipakai transaksi lain. Ulangi pesanannya dari awal.';

  @override
  String get apiErrorOrderNoTaken =>
      'Nomor struk ini sudah dipakai. Tagih lagi untuk memakai nomor berikutnya.';

  @override
  String get noAccessTitle => 'Belum ada akses kasir';

  @override
  String noAccessBody(String outlet) {
    return 'Role Anda di $outlet belum mengizinkan transaksi di kasir. Minta Manager outlet menambahkan izin itu, lalu periksa lagi.';
  }

  @override
  String get noAccessOwnerTitle => 'Aplikasi ini untuk kasir';

  @override
  String get noAccessOwnerBody =>
      'Akun Owner dipakai di web admin Maki. Aplikasi Android ini untuk Manager dan staf yang bertransaksi di kasir.';

  @override
  String noAccessSignedInAs(String name, String username) {
    return 'Masuk sebagai $name (@$username)';
  }

  @override
  String get noAccessCheckAgain => 'Periksa lagi';

  @override
  String get noAccessUnchanged => 'Akses Anda belum berubah.';

  @override
  String get apiErrorInternal => 'Terjadi kesalahan di server. Coba lagi.';

  @override
  String get apiErrorNotFound => 'Data tidak ditemukan.';

  @override
  String get apiErrorNotReady =>
      'Layanan sedang tidak tersedia. Coba lagi sebentar lagi.';

  @override
  String get apiErrorNetwork =>
      'Tidak bisa terhubung ke server. Periksa koneksi internet.';

  @override
  String get apiErrorInvalidCredentials => 'Username atau password salah.';

  @override
  String get apiErrorAccountDisabled =>
      'Akun ini dinonaktifkan. Hubungi Manager atau Owner.';

  @override
  String apiErrorRateLimited(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Terlalu banyak percobaan. Coba lagi dalam $minutes menit.',
    );
    return '$_temp0';
  }

  @override
  String get apiErrorWrongPassword => 'Password saat ini salah.';

  @override
  String apiErrorPasswordTooShort(int min) {
    return 'Password minimal $min karakter.';
  }

  @override
  String apiErrorPasswordTooLong(int max) {
    return 'Password maksimal $max karakter.';
  }

  @override
  String get apiErrorPasswordSameAsUsername =>
      'Password tidak boleh sama dengan username.';

  @override
  String get apiErrorUnauthorized =>
      'Sesi Anda sudah berakhir. Silakan masuk lagi.';

  @override
  String get apiErrorValidation => 'Periksa lagi isian yang ditandai.';

  @override
  String get voucherLabel => 'Voucher';

  @override
  String get voucherHint => 'Kode voucher';

  @override
  String get voucherApply => 'Pakai';

  @override
  String get voucherChecking => 'Memeriksa…';

  @override
  String voucherRemove(String code) {
    return 'Lepas voucher $code';
  }

  @override
  String voucherMinSpend(String amount) {
    return 'Belanja minimal $amount untuk voucher ini. Tambah pesanan atau lepas vouchernya.';
  }

  @override
  String voucherRemoved(String code, String reason) {
    return 'Voucher $code dilepas: $reason';
  }

  @override
  String summaryVoucher(String code) {
    return 'Potongan ($code)';
  }

  @override
  String get apiErrorVoucherNotFound => 'Tidak ada voucher dengan kode ini.';

  @override
  String get apiErrorVoucherInactive => 'Voucher ini sedang nonaktif.';

  @override
  String get apiErrorVoucherNotStarted => 'Voucher ini belum berlaku.';

  @override
  String get apiErrorVoucherExpired => 'Voucher ini sudah expired.';

  @override
  String get apiErrorVoucherUsedUp => 'Kuota voucher ini sudah habis.';

  @override
  String get apiErrorVoucherNotForOutlet =>
      'Voucher ini tidak berlaku di outlet ini.';

  @override
  String get apiErrorVoucherMinSpend =>
      'Belanja belum mencapai minimal belanja voucher ini.';

  @override
  String get navTables => 'Meja';

  @override
  String get tablesTitle => 'Meja';

  @override
  String get tablesIntro =>
      'Pilih meja untuk melihat statusnya, memesan di sana, atau mengosongkannya setelah customer pergi.';

  @override
  String get tablesEmpty =>
      'Outlet ini belum punya meja. Manager menambahkannya di halaman Meja admin.';

  @override
  String get tablesLoadFailed => 'Meja belum bisa dimuat.';

  @override
  String get tableLegend => 'Keterangan:';

  @override
  String get tableStatusAvailable => 'Tersedia';

  @override
  String get tableStatusOccupied => 'Terisi';

  @override
  String get tableStatusInactive => 'Nonaktif';

  @override
  String get tableStatusScheduled => 'Nonaktif terjadwal';

  @override
  String get decorationWall => 'Dinding';

  @override
  String get decorationCashier => 'Kasir';

  @override
  String get decorationDoor => 'Pintu';

  @override
  String tableSeats(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString kursi';
  }

  @override
  String tableLabel(String name, String status) {
    return 'Meja $name, $status';
  }

  @override
  String tableLabelSeats(String name, String status, String seats) {
    return 'Meja $name, $status, $seats';
  }

  @override
  String tableLayout(String area) {
    return 'Layout area $area';
  }

  @override
  String get tableUnplaced => 'Belum ditempatkan di layout:';

  @override
  String tableDetailTitle(String name) {
    return 'Meja $name';
  }

  @override
  String get tableSeatsTerm => 'Kursi';

  @override
  String get tableNoSeats => 'Tidak diisi';

  @override
  String get tableSince => 'Terisi sejak';

  @override
  String get tableOrders => 'Transaksi';

  @override
  String get tableInactiveNote =>
      'Meja ini sedang dinonaktifkan Manager, jadi tidak bisa dipilih.';

  @override
  String get tableScheduledNote =>
      'Meja ini sedang nonaktif terjadwal, jadi tidak bisa dipilih.';

  @override
  String get tableOrderHere => 'Pesan di meja ini';

  @override
  String get tablePendingHint =>
      'Transaksi sebelumnya belum terjawab. Selesaikan dulu di Detail Items.';

  @override
  String get tableRelease => 'Kosongkan Meja';

  @override
  String tableReleaseTitle(String name) {
    return 'Kosongkan meja $name?';
  }

  @override
  String get tableReleaseBody =>
      'Lakukan setelah customer meninggalkan meja. Meja jadi tersedia lagi untuk customer berikutnya.';

  @override
  String tableReleased(String name) {
    return 'Meja $name dikosongkan.';
  }

  @override
  String get tablePickTitle => 'Pilih meja';

  @override
  String get tablePickIntro =>
      'Meja yang tersedia atau terisi bisa dipilih. Pesanan tambahan di meja yang sama jadi transaksi baru.';

  @override
  String get tablePick => 'Pilih meja';

  @override
  String get tablePickOptional => 'Opsional';

  @override
  String tableChosen(String name) {
    return 'Meja $name';
  }

  @override
  String get tableChange => 'Ganti';

  @override
  String tableLetGo(String name) {
    return 'Lepas meja $name';
  }

  @override
  String tableRemoved(String name, String reason) {
    return 'Meja $name dilepas dari pesanan: $reason';
  }

  @override
  String get tableUnavailableInactive => 'mejanya sedang dinonaktifkan.';

  @override
  String get tableUnavailableScheduled => 'mejanya sedang nonaktif terjadwal.';

  @override
  String get tableUnavailableMissing => 'mejanya sudah dihapus.';

  @override
  String get receiptTable => 'Meja';

  @override
  String historyTable(String name) {
    return 'Meja $name';
  }

  @override
  String get apiErrorTableUnavailable => 'Meja ini sedang tidak bisa dipilih.';

  @override
  String get apiErrorTableNotFound => 'Meja tidak ditemukan.';

  @override
  String get standLabel => 'Nomor papan';

  @override
  String get standPlaceholder => 'Misalnya 12';

  @override
  String get standHint =>
      'Wajib untuk dine-in: nomor yang tertulis di papan tamu.';

  @override
  String get standFormat =>
      '1–10 huruf, angka atau tanda hubung, misalnya 12, A5 atau B-3.';

  @override
  String standTableDropped(String name) {
    return 'Outlet ini sekarang memakai Mode Nomor, jadi meja $name dilepas dari pesanan. Isi nomor papan tamu.';
  }

  @override
  String standDropped(String number) {
    return 'Outlet ini sekarang memakai Mode Meja, jadi nomor papan $number dilepas dari pesanan.';
  }

  @override
  String get standNowNumber =>
      'Outlet ini sekarang memakai Mode Nomor. Isi nomor papan tamu.';

  @override
  String get receiptStand => 'Nomor papan';

  @override
  String historyStand(String number) {
    return 'No. $number';
  }

  @override
  String get tablesNumberMode =>
      'Outlet ini memakai Mode Nomor: tamu dine-in membawa papan nomor, dan kasir mengetik nomornya di Detail Items, tanpa memilih meja.';

  @override
  String get apiErrorDineInModeChanged =>
      'Cara outlet ini mencatat tempat tamu dine-in baru saja berubah: di meja, atau dengan nomor papan.';
}
