import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

String createDateText(Timestamp timestamp) {
  final date = timestamp.toDate();
  final year = date.year.toString();
  final month = date.month.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final day = date.day.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加

  final dateText = '$year/$month/$day';
  return dateText;
}
