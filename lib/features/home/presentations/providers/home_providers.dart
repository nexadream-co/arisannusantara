import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/home_repository.dart';
import '../../domain/usecases/get_paid_groups_percentage_usecase.dart';

part 'home_providers.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository();
}

@riverpod
GetPaidGroupsPercentageUsecase getPaidGroupsPercentageUsecase(Ref ref,
) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetPaidGroupsPercentageUsecase(repository: repository);
}
