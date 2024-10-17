List<String> getLastTwelveMonths() {
  final now = DateTime.now();
  List<String> months = [];

  // 過去12ヶ月の月を取得
  for (int i = 0; i < 12; i++) {
    final adjustedDate = DateTime(now.year, now.month - i, 1);
    months.add(adjustedDate.month.toString());
  }

  // 月を逆順にして今月を最後に追加
  months = months.toList();
  return months;
}
