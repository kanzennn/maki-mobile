/// The most characters a stand's number has.
const maxStand = 10;

/// The server's rule for a stand's number (`orders_stand_number_check`): 1
/// to 10 capitals, digits and hyphens, a hyphen only between them, as 12,
/// A5 or B-3.
final _pattern = RegExp(r'^[A-Z0-9]([A-Z0-9-]{0,8}[A-Z0-9])?$');

/// A stand's number as typed, the way the server keeps it: no spaces at its
/// ends, its small letters capitals.
String standNumber(String typed) => typed.trim().toUpperCase();

/// Whether the number typed is one the server takes.
bool validStand(String typed) => _pattern.hasMatch(standNumber(typed));
