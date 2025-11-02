import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/app/result.dart';
import 'home_providers.dart';

part 'get_paid_groups_percentage_provider.g.dart';

@riverpod
Future<Result<double?>> getPaidGroupsPercentage(Ref ref) async {
  final usecase = ref.watch(getPaidGroupsPercentageUsecaseProvider);
  return usecase();
}
