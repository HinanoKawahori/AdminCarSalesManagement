import 'package:intl/intl.dart';

String formatCurrency(int? amount) {
  if (amount == null) return '0円';
  final formatter = NumberFormat('#,###');
  return '${formatter.format(amount)}円';
}

String formatPhoneNumber(String phoneNumber) {
  if (phoneNumber.length != 11) return phoneNumber;
  return '${phoneNumber.substring(0, 3)}-${phoneNumber.substring(3, 7)}-${phoneNumber.substring(7)}';
}
