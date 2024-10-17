enum CaseStatus {
  assigningPerson,
  scheduling, // 日程調整中
  confirmedVisit, // 訪問日確定
  pending, // 検討待ち
  success, // 成約
  lost, // 失注
}

extension SalesStatusExtension on CaseStatus {
  int get value {
    switch (this) {
      case CaseStatus.assigningPerson:
        return 0;
      case CaseStatus.scheduling:
        return 10;
      case CaseStatus.confirmedVisit:
        return 20;
      case CaseStatus.pending:
        return 30;
      case CaseStatus.success:
        return 100;
      case CaseStatus.lost:
        return 200;
      default:
        return 0;
    }
  }
}
