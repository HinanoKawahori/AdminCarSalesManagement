import 'package:cloud_firestore/cloud_firestore.dart';

int switchGenderToInt(String gender) {
  return switch (gender) {
    '男性' => 1,
    '女性' => 2,
    _ => 1,
  };
}

String switchGenderToString(int gender) {
  return switch (gender) {
    1 => '男性',
    2 => '女性',
    _ => '男性',
  };
}

//TODO 役割変える
int switchRoleToInt(String role) {
  return switch (role) {
    'システム管理者' => 1,
    '一般ユーザー' => 2,
    _ => 2,
  };
}

String switchRoleToString(int role) {
  return switch (role) {
    1 => 'システム管理者',
    2 => '一般ユーザー',
    _ => '一般ユーザー',
  };
}

String switchDateText(Timestamp timestamp) {
  final date = timestamp.toDate();
  final year = date.year.toString();
  final month = date.month.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final day = date.day.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final dateText = '$year.$month.$day';
  return dateText;
}

String switchDateTimeText(Timestamp timestamp) {
  final date = timestamp.toDate();
  final year = date.year.toString();
  final month = date.month.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final day = date.day.toString().padLeft(2, '0'); // 一桁の場合に先頭に0を追加
  final hour = date.hour.toString();
  final min = date.minute.toString();
  final dateTimeText = '$year.$month.$day   $hour:$min';
  return dateTimeText;
}

String switchTimeTextInChat(Timestamp timestamp) {
  final date = timestamp.toDate();
  final hours = date.hour.toString().padLeft(2, '0');
  final minutes = date.minute.toString().padLeft(2, '0');
  final timeText = '$hours:$minutes';
  return timeText;
}

//ステータス別に色を返す

//ステータス番号から、テキストを返す
String getStatusText(int status) {
  switch (status) {
    case 0:
      return '担当者未定';
    case 10:
      return '日程調整中';
    case 20:
      return '訪問日確定';
    case 30:
      return '検討待ち';
    case 100:
      return '成約';
    case 200:
      return '失注';
    default:
      return '日程調整中';
  }
}

//ステータステキストから、ステータス番号を返す
int getStatusCode(String statusText) {
  switch (statusText) {
    case '日程調整中':
      return 10;
    case '訪問日確定':
      return 20;
    case '検討待ち':
      return 30;
    case '成約':
      return 100;
    case '失注':
      return 200;
    default:
      return 10; // 不明なステータスの時に返すデフォルト値
  }
}

//タブ番号から、ステータス番号を返す
int getStatusIntByTabIndex(int tabIndex) {
  switch (tabIndex) {
    case 1:
      return 10;
    case 2:
      return 20;
    case 3:
      return 30;
    default:
      return 10; // 不明なステータスの時に返すデフォルト値
  }
}

// テキストドロップボタンのアイテム

