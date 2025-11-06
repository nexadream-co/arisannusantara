enum HistoryMemberFilterEnum { all, winners, skipped, active, inactive }

extension HistoryMemberFilterEnumX on HistoryMemberFilterEnum {
  String get label {
    switch (this) {
      case HistoryMemberFilterEnum.all:
        return 'Semua';
      case HistoryMemberFilterEnum.winners:
        return 'Pemenang';
      case HistoryMemberFilterEnum.skipped:
        return 'Lewati';
      case HistoryMemberFilterEnum.active:
        return 'Aktif';
      case HistoryMemberFilterEnum.inactive:
        return 'Tidak Aktif';
    }
  }
}
