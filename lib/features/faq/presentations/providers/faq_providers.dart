import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/app/result.dart';
import '../../../profile/domain/entities/faq_entity.dart';
import '../../data/faq_repository.dart';
import '../../domain/usecases/get_faqs_usecase.dart';

part 'faq_providers.g.dart';

@riverpod
FaqRepository faqRepository(Ref ref) {
  return FaqRepository();
}

@riverpod
Future<Result<List<FaqEntity>>> getFaq(Ref ref, String? search) async {
  final repository = ref.read(faqRepositoryProvider);
  final usecase = GetFaqsUsecase(repository: repository);
  return await usecase(search: search);
}
