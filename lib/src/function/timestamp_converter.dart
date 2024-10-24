import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Timestamp timestamp) {
    return timestamp;
  }

  @override
  Timestamp toJson(Timestamp date) => date;
}

//日時表記「yyyy/mm/dd」
String createDateTimeText(Timestamp timestamp) {
  final date = timestamp.toDate();
  final year = date.year.toString();
  final month = date.month.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final day = date.day.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final hour = date.hour.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final minute = date.minute.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加

  final dateText = '$year/$month/$day/ $hour:$minute';
  return dateText;
}

// String createDateText(Timestamp timestamp) {
//   final date = timestamp.toDate();
//   final year = date.year.toString();
//   final month = date.month.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
//   final day = date.day.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加

//   final dateText = '$year/$month/$day';
//   return dateText;
// }
String createDateText(Timestamp timestamp) {
  final date = timestamp.toDate();

  // NumberFormatを使用して各部分を個別にフォーマット
  final numberFormatter = NumberFormat('00', 'en_US');

  final year = numberFormatter.format(date.year);
  final month = numberFormatter.format(date.month);
  final day = numberFormatter.format(date.day);

  return '$year/$month/$day';
}
// String createDateText(Timestamp timestamp) {
//   final date = timestamp.toDate();

//   // 年、月、日をASCIIの数字として処理
//   final year = date.year
//       .toString()
//       .split('')
//       .map((c) => String.fromCharCode(c.codeUnitAt(0)))
//       .join('');
//   final month = date.month
//       .toString()
//       .padLeft(2, '0')
//       .split('')
//       .map((c) => String.fromCharCode(c.codeUnitAt(0)))
//       .join('');
//   final day = date.day
//       .toString()
//       .padLeft(2, '0')
//       .split('')
//       .map((c) => String.fromCharCode(c.codeUnitAt(0)))
//       .join('');

//   return '$year/$month/$day';
// }
