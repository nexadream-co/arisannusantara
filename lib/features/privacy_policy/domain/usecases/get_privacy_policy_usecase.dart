import '../../../../core/app/result.dart';
import '../../data/privacy_policy_repository.dart';

class GetPrivacyPolicyUsecase {
  final PrivacyPolicyRepository repository;

  GetPrivacyPolicyUsecase({required this.repository});

  Future<Result<Map<String, dynamic>>> call() async {
    return await repository.getPrivacyPolicy();
  }
}
