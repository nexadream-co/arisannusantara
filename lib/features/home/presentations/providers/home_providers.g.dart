// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
const homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  const HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'a7ad35b71d152c2f2e026facffd4f91979e425ab';

@ProviderFor(getPaidGroupsPercentageUsecase)
const getPaidGroupsPercentageUsecaseProvider =
    GetPaidGroupsPercentageUsecaseProvider._();

final class GetPaidGroupsPercentageUsecaseProvider
    extends
        $FunctionalProvider<
          GetPaidGroupsPercentageUsecase,
          GetPaidGroupsPercentageUsecase,
          GetPaidGroupsPercentageUsecase
        >
    with $Provider<GetPaidGroupsPercentageUsecase> {
  const GetPaidGroupsPercentageUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPaidGroupsPercentageUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPaidGroupsPercentageUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetPaidGroupsPercentageUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPaidGroupsPercentageUsecase create(Ref ref) {
    return getPaidGroupsPercentageUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPaidGroupsPercentageUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPaidGroupsPercentageUsecase>(
        value,
      ),
    );
  }
}

String _$getPaidGroupsPercentageUsecaseHash() =>
    r'a44330953557c3716f9bb2057cc091d8c58fd6ab';
