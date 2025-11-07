import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/payment_account_entity.dart';

class UpdatePaymentAccountUsecase {
  final GroupRepository repository;

  UpdatePaymentAccountUsecase({required this.repository});

  Future<Result<String>> call({
    required String groupId,
    required PaymentAccountEntity account,
  }) async {
    return await repository.updatePaymentAccountInGroup(
      groupId: groupId,
      account: account,
    );
  }
}
