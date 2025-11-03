import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/term_condition_repository.dart';
import '../../domain/usecases/get_term_condition_usecase.dart';

part 'term_condition_providers.g.dart';

@riverpod
TermConditionRepository termConditionRepository(Ref ref) {
  return TermConditionRepository();
}

@riverpod
GetTermConditionUsecase getTermConditionUsecase(Ref ref) {
  final repository = ref.watch(termConditionRepositoryProvider);
  return GetTermConditionUsecase(repository: repository);
}
