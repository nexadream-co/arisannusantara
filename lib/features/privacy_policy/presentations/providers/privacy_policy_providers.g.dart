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

@ProviderFor(getPrivacyPolicy)
const getPrivacyPolicyProvider = GetPrivacyPolicyProvider._();

final class GetPrivacyPolicyProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<Map<String, dynamic>>>,
          Result<Map<String, dynamic>>,
          FutureOr<Result<Map<String, dynamic>>>
        >
    with
        $FutureModifier<Result<Map<String, dynamic>>>,
        $FutureProvider<Result<Map<String, dynamic>>> {
  const GetPrivacyPolicyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPrivacyPolicyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPrivacyPolicyHash();

  @$internal
  @override
  $FutureProviderElement<Result<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<Map<String, dynamic>>> create(Ref ref) {
    return getPrivacyPolicy(ref);
  }
}

String _$getPrivacyPolicyHash() => r'd12e4cc65a5ed06407ace65ca27e43016a6fb8d4';
