// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invitations_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetInvitationsNotifier)
const getInvitationsProvider = GetInvitationsNotifierProvider._();

final class GetInvitationsNotifierProvider
    extends $NotifierProvider<GetInvitationsNotifier, GetInvitationsState> {
  const GetInvitationsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getInvitationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getInvitationsNotifierHash();

  @$internal
  @override
  GetInvitationsNotifier create() => GetInvitationsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetInvitationsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetInvitationsState>(value),
    );
  }
}

String _$getInvitationsNotifierHash() =>
    r'31bd95045010b4672a3000a4128d69ca7ee4a9e5';

abstract class _$GetInvitationsNotifier extends $Notifier<GetInvitationsState> {
  GetInvitationsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetInvitationsState, GetInvitationsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetInvitationsState, GetInvitationsState>,
              GetInvitationsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
