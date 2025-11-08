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

@ProviderFor(getTermCondition)
const getTermConditionProvider = GetTermConditionProvider._();

final class GetTermConditionProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<Map<String, dynamic>>>,
          Result<Map<String, dynamic>>,
          FutureOr<Result<Map<String, dynamic>>>
        >
    with
        $FutureModifier<Result<Map<String, dynamic>>>,
        $FutureProvider<Result<Map<String, dynamic>>> {
  const GetTermConditionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTermConditionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTermConditionHash();

  @$internal
  @override
  $FutureProviderElement<Result<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<Map<String, dynamic>>> create(Ref ref) {
    return getTermCondition(ref);
  }
}

String _$getTermConditionHash() => r'3189cb6e9fc8d87119ea0c4d153592178a79e154';
