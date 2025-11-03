// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_condition_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(termConditionRepository)
const termConditionRepositoryProvider = TermConditionRepositoryProvider._();

final class TermConditionRepositoryProvider
    extends
        $FunctionalProvider<
          TermConditionRepository,
          TermConditionRepository,
          TermConditionRepository
        >
    with $Provider<TermConditionRepository> {
  const TermConditionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'termConditionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$termConditionRepositoryHash();

  @$internal
  @override
  $ProviderElement<TermConditionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TermConditionRepository create(Ref ref) {
    return termConditionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TermConditionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TermConditionRepository>(value),
    );
  }
}

String _$termConditionRepositoryHash() =>
    r'2e7000608cd747845d58ede8bd569609a78826db';

@ProviderFor(getTermConditionUsecase)
const getTermConditionUsecaseProvider = GetTermConditionUsecaseProvider._();

final class GetTermConditionUsecaseProvider
    extends
        $FunctionalProvider<
          GetTermConditionUsecase,
          GetTermConditionUsecase,
          GetTermConditionUsecase
        >
    with $Provider<GetTermConditionUsecase> {
  const GetTermConditionUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTermConditionUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTermConditionUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetTermConditionUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTermConditionUsecase create(Ref ref) {
    return getTermConditionUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTermConditionUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTermConditionUsecase>(value),
    );
  }
}

String _$getTermConditionUsecaseHash() =>
    r'4cfddb1cb85526921aeaea8d2fd73e7377de8051';
