// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_groups_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetGroupsNotifier)
const getGroupsProvider = GetGroupsNotifierProvider._();

final class GetGroupsNotifierProvider
    extends $NotifierProvider<GetGroupsNotifier, GetGroupsState> {
  const GetGroupsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGroupsNotifierHash();

  @$internal
  @override
  GetGroupsNotifier create() => GetGroupsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGroupsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGroupsState>(value),
    );
  }
}

String _$getGroupsNotifierHash() => r'7661fe11fbbcc88acc46c7b81703f6b8311392d1';

abstract class _$GetGroupsNotifier extends $Notifier<GetGroupsState> {
  GetGroupsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetGroupsState, GetGroupsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetGroupsState, GetGroupsState>,
              GetGroupsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
