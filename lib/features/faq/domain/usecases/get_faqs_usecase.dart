import '../../../../core/app/result.dart';
import '../../../profile/domain/entities/faq_entity.dart';
import '../../data/faq_repository.dart';

class GetFaqsUsecase {
  final FaqRepository repository;

  GetFaqsUsecase({required this.repository});

  Future<Result<List<FaqEntity>>> call() async {
    return await repository.getFaqs();
  }
}
