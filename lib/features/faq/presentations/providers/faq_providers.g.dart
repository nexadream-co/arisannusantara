// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(faqRepository)
const faqRepositoryProvider = FaqRepositoryProvider._();

final class FaqRepositoryProvider
    extends $FunctionalProvider<FaqRepository, FaqRepository, FaqRepository>
    with $Provider<FaqRepository> {
  const FaqRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faqRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faqRepositoryHash();

  @$internal
  @override
  $ProviderElement<FaqRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FaqRepository create(Ref ref) {
    return faqRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaqRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaqRepository>(value),
    );
  }
}

String _$faqRepositoryHash() => r'4f6d1f9cfb2622366f035d88ac7b56716dab77d1';

@ProviderFor(getFaqsUsecase)
const getFaqsUsecaseProvider = GetFaqsUsecaseProvider._();

final class GetFaqsUsecaseProvider
    extends $FunctionalProvider<GetFaqsUsecase, GetFaqsUsecase, GetFaqsUsecase>
    with $Provider<GetFaqsUsecase> {
  const GetFaqsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFaqsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFaqsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetFaqsUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetFaqsUsecase create(Ref ref) {
    return getFaqsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFaqsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFaqsUsecase>(value),
    );
  }
}

String _$getFaqsUsecaseHash() => r'dba89a708523dd670e61a062183e0c01f9bb1524';
