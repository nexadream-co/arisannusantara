import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/app/result.dart';
import '../../data/privacy_policy_repository.dart';
import '../../domain/usecases/get_privacy_policy_usecase.dart';

part 'privacy_policy_providers.g.dart';

@riverpod
PrivacyPolicyRepository privacyPolicyRepository(Ref ref) {
  return PrivacyPolicyRepository();
}

@riverpod
Future<Result<Map<String, dynamic>>> getPrivacyPolicy(Ref ref) async {
  final repository = ref.read(privacyPolicyRepositoryProvider);
  final usecase = GetPrivacyPolicyUsecase(repository: repository);
  return await usecase();
}
