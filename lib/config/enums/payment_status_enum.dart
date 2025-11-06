enum PaymentStatusEnum { unpaid, paid, skip, cancel }

extension PaymentStatusEnumExtension on PaymentStatusEnum {
  String get label {
    switch (this) {
      case PaymentStatusEnum.unpaid:
        return 'Belum Bayar';
      case PaymentStatusEnum.paid:
        return 'Sudah Bayar';
      case PaymentStatusEnum.skip:
        return 'Lewati';
      case PaymentStatusEnum.cancel:
        return 'Batal';
    }
  }

  String get name {
    switch (this) {
      case PaymentStatusEnum.unpaid:
        return 'unpaid';
      case PaymentStatusEnum.paid:
        return 'paid';
      case PaymentStatusEnum.skip:
        return 'skip';
      case PaymentStatusEnum.cancel:
        return 'cancel';
    }
  }
}
