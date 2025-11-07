import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class DeletePaymentAccountUsecase {
  final GroupRepository repository;

  DeletePaymentAccountUsecase({required this.repository});

  Future<Result<String>> call({
    required String groupId,
    required String accountId,
  }) async {
    return await repository.deletePaymentAccountFromGroup(
      groupId: groupId,
      accountId: accountId,
    );
  }
}
