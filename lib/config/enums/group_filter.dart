enum GroupFilter { joined, all, invited, owned }

extension GroupFilterExtension on GroupFilter {
  String get label {
    switch (this) {
      case GroupFilter.joined:
        return 'Tergabung';
      case GroupFilter.all:
        return 'Semua';
      case GroupFilter.invited:
        return 'Undangan';
      case GroupFilter.owned:
        return 'Dikelola';
    }
  }
}
