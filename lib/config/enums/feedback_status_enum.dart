enum FeedbackStatusEnum { process, done, ignored }

extension FeedbackStatusEnumExtension on FeedbackStatusEnum {
  String get label {
    switch (this) {
      case FeedbackStatusEnum.process:
        return 'Proses';
      case FeedbackStatusEnum.done:
        return 'Selesai';
      case FeedbackStatusEnum.ignored:
        return 'Diabaikan';
    }
  }

  String get name {
    switch (this) {
      case FeedbackStatusEnum.process:
        return 'process';
      case FeedbackStatusEnum.done:
        return 'done';
      case FeedbackStatusEnum.ignored:
        return 'ignored';
    }
  }
}
