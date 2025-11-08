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

@ProviderFor(getFaq)
const getFaqProvider = GetFaqFamily._();

final class GetFaqProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<List<FaqEntity>>>,
          Result<List<FaqEntity>>,
          FutureOr<Result<List<FaqEntity>>>
        >
    with
        $FutureModifier<Result<List<FaqEntity>>>,
        $FutureProvider<Result<List<FaqEntity>>> {
  const GetFaqProvider._({
    required GetFaqFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'getFaqProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getFaqHash();

  @override
  String toString() {
    return r'getFaqProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<List<FaqEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<List<FaqEntity>>> create(Ref ref) {
    final argument = this.argument as String?;
    return getFaq(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFaqProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getFaqHash() => r'85a4f01608f219cb6cc9482eb4de66870ce05bf6';

final class GetFaqFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<List<FaqEntity>>>, String?> {
  const GetFaqFamily._()
    : super(
        retry: null,
        name: r'getFaqProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetFaqProvider call(String? search) =>
      GetFaqProvider._(argument: search, from: this);

  @override
  String toString() => r'getFaqProvider';
}
