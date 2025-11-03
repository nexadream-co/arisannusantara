import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/privacy_policy_repository.dart';
import '../../domain/usecases/get_privacy_policy_usecase.dart';

part 'privacy_policy_providers.g.dart';

@riverpod
PrivacyPolicyRepository privacyPolicyRepository(Ref ref) {
  return PrivacyPolicyRepository();
}

@riverpod
GetPrivacyPolicyUsecase getPrivacyPolicyUsecase(Ref ref) {
  final repository = ref.watch(privacyPolicyRepositoryProvider);
  return GetPrivacyPolicyUsecase(repository: repository);
}
