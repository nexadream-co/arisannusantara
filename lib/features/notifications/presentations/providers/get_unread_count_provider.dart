import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'notification_providers.dart';

part 'get_unread_count_provider.g.dart';

@riverpod
Future<int> getUnreadCount(Ref ref) async {
  final usecase = ref.watch(getUnreadCountUsecaseProvider);
  final result = await usecase();

  return result.resultValue ?? 0;
}
