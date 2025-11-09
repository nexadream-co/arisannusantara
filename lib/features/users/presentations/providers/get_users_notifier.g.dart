// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetUsersNotifier)
const getUsersProvider = GetUsersNotifierProvider._();

final class GetUsersNotifierProvider
    extends $NotifierProvider<GetUsersNotifier, GetUsersState> {
  const GetUsersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUsersNotifierHash();

  @$internal
  @override
  GetUsersNotifier create() => GetUsersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUsersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUsersState>(value),
    );
  }
}

String _$getUsersNotifierHash() => r'e5c6cc9784b84868d323ce2efd178f979d672315';

abstract class _$GetUsersNotifier extends $Notifier<GetUsersState> {
  GetUsersState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetUsersState, GetUsersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetUsersState, GetUsersState>,
              GetUsersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
