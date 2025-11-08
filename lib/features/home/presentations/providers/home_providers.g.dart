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

@ProviderFor(getTotalFeedbacks)
const getTotalFeedbacksProvider = GetTotalFeedbacksFamily._();

final class GetTotalFeedbacksProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<int>>,
          Result<int>,
          FutureOr<Result<int>>
        >
    with $FutureModifier<Result<int>>, $FutureProvider<Result<int>> {
  const GetTotalFeedbacksProvider._({
    required GetTotalFeedbacksFamily super.from,
    required PeriodFilter super.argument,
  }) : super(
         retry: null,
         name: r'getTotalFeedbacksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTotalFeedbacksHash();

  @override
  String toString() {
    return r'getTotalFeedbacksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<int>> create(Ref ref) {
    final argument = this.argument as PeriodFilter;
    return getTotalFeedbacks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalFeedbacksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTotalFeedbacksHash() => r'559fac5966ffc6c00293fb7452e35584e8f34f4a';

final class GetTotalFeedbacksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<int>>, PeriodFilter> {
  const GetTotalFeedbacksFamily._()
    : super(
        retry: null,
        name: r'getTotalFeedbacksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTotalFeedbacksProvider call(PeriodFilter period) =>
      GetTotalFeedbacksProvider._(argument: period, from: this);

  @override
  String toString() => r'getTotalFeedbacksProvider';
}

@ProviderFor(getTotalGroups)
const getTotalGroupsProvider = GetTotalGroupsFamily._();

final class GetTotalGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<int>>,
          Result<int>,
          FutureOr<Result<int>>
        >
    with $FutureModifier<Result<int>>, $FutureProvider<Result<int>> {
  const GetTotalGroupsProvider._({
    required GetTotalGroupsFamily super.from,
    required PeriodFilter super.argument,
  }) : super(
         retry: null,
         name: r'getTotalGroupsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTotalGroupsHash();

  @override
  String toString() {
    return r'getTotalGroupsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<int>> create(Ref ref) {
    final argument = this.argument as PeriodFilter;
    return getTotalGroups(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalGroupsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTotalGroupsHash() => r'8c93e212c857bc91844973370a511d5af253568e';

final class GetTotalGroupsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<int>>, PeriodFilter> {
  const GetTotalGroupsFamily._()
    : super(
        retry: null,
        name: r'getTotalGroupsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTotalGroupsProvider call(PeriodFilter period) =>
      GetTotalGroupsProvider._(argument: period, from: this);

  @override
  String toString() => r'getTotalGroupsProvider';
}

@ProviderFor(getTotalShuffle)
const getTotalShuffleProvider = GetTotalShuffleFamily._();

final class GetTotalShuffleProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<int>>,
          Result<int>,
          FutureOr<Result<int>>
        >
    with $FutureModifier<Result<int>>, $FutureProvider<Result<int>> {
  const GetTotalShuffleProvider._({
    required GetTotalShuffleFamily super.from,
    required PeriodFilter super.argument,
  }) : super(
         retry: null,
         name: r'getTotalShuffleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTotalShuffleHash();

  @override
  String toString() {
    return r'getTotalShuffleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<int>> create(Ref ref) {
    final argument = this.argument as PeriodFilter;
    return getTotalShuffle(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalShuffleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTotalShuffleHash() => r'3157e89c15c0b3b67247a62b6ec43d56877c6745';

final class GetTotalShuffleFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<int>>, PeriodFilter> {
  const GetTotalShuffleFamily._()
    : super(
        retry: null,
        name: r'getTotalShuffleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTotalShuffleProvider call(PeriodFilter period) =>
      GetTotalShuffleProvider._(argument: period, from: this);

  @override
  String toString() => r'getTotalShuffleProvider';
}

@ProviderFor(getTotalUsers)
const getTotalUsersProvider = GetTotalUsersFamily._();

final class GetTotalUsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<int>>,
          Result<int>,
          FutureOr<Result<int>>
        >
    with $FutureModifier<Result<int>>, $FutureProvider<Result<int>> {
  const GetTotalUsersProvider._({
    required GetTotalUsersFamily super.from,
    required PeriodFilter super.argument,
  }) : super(
         retry: null,
         name: r'getTotalUsersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTotalUsersHash();

  @override
  String toString() {
    return r'getTotalUsersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<int>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<int>> create(Ref ref) {
    final argument = this.argument as PeriodFilter;
    return getTotalUsers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalUsersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTotalUsersHash() => r'd7e5a3a68ea6e08416d00b048d86225250e136c3';

final class GetTotalUsersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<int>>, PeriodFilter> {
  const GetTotalUsersFamily._()
    : super(
        retry: null,
        name: r'getTotalUsersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTotalUsersProvider call(PeriodFilter period) =>
      GetTotalUsersProvider._(argument: period, from: this);

  @override
  String toString() => r'getTotalUsersProvider';
}
