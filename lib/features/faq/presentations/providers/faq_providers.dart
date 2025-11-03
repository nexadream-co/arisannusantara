import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/faq_repository.dart';
import '../../domain/usecases/get_faqs_usecase.dart';

part 'faq_providers.g.dart';

@riverpod
FaqRepository faqRepository(Ref ref) {
  return FaqRepository();
}

@riverpod
GetFaqsUsecase getFaqsUsecase(Ref ref) {
  final repository = ref.watch(faqRepositoryProvider);
  return GetFaqsUsecase(repository: repository);
}
