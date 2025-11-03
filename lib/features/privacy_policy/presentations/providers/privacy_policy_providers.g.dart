// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(privacyPolicyRepository)
const privacyPolicyRepositoryProvider = PrivacyPolicyRepositoryProvider._();

final class PrivacyPolicyRepositoryProvider
    extends
        $FunctionalProvider<
          PrivacyPolicyRepository,
          PrivacyPolicyRepository,
          PrivacyPolicyRepository
        >
    with $Provider<PrivacyPolicyRepository> {
  const PrivacyPolicyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'privacyPolicyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$privacyPolicyRepositoryHash();

  @$internal
  @override
  $ProviderElement<PrivacyPolicyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PrivacyPolicyRepository create(Ref ref) {
    return privacyPolicyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PrivacyPolicyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PrivacyPolicyRepository>(value),
    );
  }
}

String _$privacyPolicyRepositoryHash() =>
    r'8e63e1bd216db68d7d2ad9912008911549b3667d';

@ProviderFor(getPrivacyPolicyUsecase)
const getPrivacyPolicyUsecaseProvider = GetPrivacyPolicyUsecaseProvider._();

final class GetPrivacyPolicyUsecaseProvider
    extends
        $FunctionalProvider<
          GetPrivacyPolicyUsecase,
          GetPrivacyPolicyUsecase,
          GetPrivacyPolicyUsecase
        >
    with $Provider<GetPrivacyPolicyUsecase> {
  const GetPrivacyPolicyUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPrivacyPolicyUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPrivacyPolicyUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetPrivacyPolicyUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPrivacyPolicyUsecase create(Ref ref) {
    return getPrivacyPolicyUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPrivacyPolicyUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPrivacyPolicyUsecase>(value),
    );
  }
}

String _$getPrivacyPolicyUsecaseHash() =>
    r'4b6632c7685538d74bd158c6ba60f70154655f32';
