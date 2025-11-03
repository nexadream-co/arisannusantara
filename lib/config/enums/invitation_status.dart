enum InvitationStatus { pending, approved, rejected }

extension InvitationStatusExtension on InvitationStatus {
  String get label {
    switch (this) {
      case InvitationStatus.pending:
        return 'Menunggu';
      case InvitationStatus.approved:
        return 'Disetujui';
      case InvitationStatus.rejected:
        return 'Ditolak';
    }
  }

  String get name {
    switch (this) {
      case InvitationStatus.pending:
        return 'pending';
      case InvitationStatus.approved:
        return 'approved';
      case InvitationStatus.rejected:
        return 'rejected';
    }
  }
}
