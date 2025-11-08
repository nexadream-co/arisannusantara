// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedbackRepository)
const feedbackRepositoryProvider = FeedbackRepositoryProvider._();

final class FeedbackRepositoryProvider
    extends
        $FunctionalProvider<
          FeedbackRepository,
          FeedbackRepository,
          FeedbackRepository
        >
    with $Provider<FeedbackRepository> {
  const FeedbackRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedbackRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedbackRepositoryHash();

  @$internal
  @override
  $ProviderElement<FeedbackRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FeedbackRepository create(Ref ref) {
    return feedbackRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedbackRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedbackRepository>(value),
    );
  }
}

String _$feedbackRepositoryHash() =>
    r'30aef00765609c08be0b12d3b5315b46c8e5a23b';

@ProviderFor(getFeedbacksUsecase)
const getFeedbacksUsecaseProvider = GetFeedbacksUsecaseProvider._();

final class GetFeedbacksUsecaseProvider
    extends
        $FunctionalProvider<
          GetFeedbacksUsecase,
          GetFeedbacksUsecase,
          GetFeedbacksUsecase
        >
    with $Provider<GetFeedbacksUsecase> {
  const GetFeedbacksUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFeedbacksUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFeedbacksUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetFeedbacksUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetFeedbacksUsecase create(Ref ref) {
    return getFeedbacksUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFeedbacksUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFeedbacksUsecase>(value),
    );
  }
}

String _$getFeedbacksUsecaseHash() =>
    r'204baac4e274664524f829e0189fd35979b2df22';

@ProviderFor(createFeedbackUsecase)
const createFeedbackUsecaseProvider = CreateFeedbackUsecaseProvider._();

final class CreateFeedbackUsecaseProvider
    extends
        $FunctionalProvider<
          CreateFeedbackUsecase,
          CreateFeedbackUsecase,
          CreateFeedbackUsecase
        >
    with $Provider<CreateFeedbackUsecase> {
  const CreateFeedbackUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createFeedbackUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createFeedbackUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateFeedbackUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateFeedbackUsecase create(Ref ref) {
    return createFeedbackUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateFeedbackUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateFeedbackUsecase>(value),
    );
  }
}

String _$createFeedbackUsecaseHash() =>
    r'52c1c71cd318e16591246e86720bcce43df3a2f3';

@ProviderFor(deleteFeedbackUsecase)
const deleteFeedbackUsecaseProvider = DeleteFeedbackUsecaseProvider._();

final class DeleteFeedbackUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteFeedbackUsecase,
          DeleteFeedbackUsecase,
          DeleteFeedbackUsecase
        >
    with $Provider<DeleteFeedbackUsecase> {
  const DeleteFeedbackUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteFeedbackUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteFeedbackUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteFeedbackUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteFeedbackUsecase create(Ref ref) {
    return deleteFeedbackUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteFeedbackUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteFeedbackUsecase>(value),
    );
  }
}

String _$deleteFeedbackUsecaseHash() =>
    r'145e8ae73a47d9fae17d450605e0fb0897323e9e';
