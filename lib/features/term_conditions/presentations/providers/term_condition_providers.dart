import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/app/result.dart';
import '../../data/term_condition_repository.dart';
import '../../domain/usecases/get_term_condition_usecase.dart';

part 'term_condition_providers.g.dart';

@riverpod
TermConditionRepository termConditionRepository(Ref ref) {
  return TermConditionRepository();
}

@riverpod
Future<Result<Map<String, dynamic>>> getTermCondition(Ref ref) async {
  final repository = ref.read(termConditionRepositoryProvider);
  final usecase = GetTermConditionUsecase(repository: repository);
  return await usecase();
}
