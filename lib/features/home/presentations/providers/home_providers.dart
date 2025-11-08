import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/enums/period_filter.dart';
import '../../../../core/app/result.dart';
import '../../data/home_repository.dart';
import '../../domain/usecases/get_paid_groups_percentage_usecase.dart';
import '../../domain/usecases/get_total_feedbacks_usecase.dart';
import '../../domain/usecases/get_total_groups_usecase.dart';
import '../../domain/usecases/get_total_shuffle_usecase.dart';
import '../../domain/usecases/get_total_users_usecase.dart';

part 'home_providers.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository();
}

@riverpod
GetPaidGroupsPercentageUsecase getPaidGroupsPercentageUsecase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetPaidGroupsPercentageUsecase(repository: repository);
}

@riverpod
Future<Result<int>> getTotalFeedbacks(Ref ref, PeriodFilter period) async {
  final repository = ref.read(homeRepositoryProvider);
  final usecase = GetTotalFeedbacksUsecase(repository: repository);
  return await usecase(period: period);
}

@riverpod
Future<Result<int>> getTotalGroups(Ref ref, PeriodFilter period) async {
  final repository = ref.read(homeRepositoryProvider);
  final usecase = GetTotalGroupsUsecase(repository: repository);
  return await usecase(period: period);
}

@riverpod
Future<Result<int>> getTotalShuffle(Ref ref, PeriodFilter period) async {
  final repository = ref.read(homeRepositoryProvider);
  final usecase = GetTotalShuffleUsecase(repository: repository);
  return await usecase(period: period);
}

@riverpod
Future<Result<int>> getTotalUsers(Ref ref, PeriodFilter period) async {
  final repository = ref.read(homeRepositoryProvider);
  final usecase = GetTotalUsersUsecase(repository: repository);
  return await usecase(period: period);
}
