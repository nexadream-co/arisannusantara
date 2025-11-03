// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetNotificationsNotifier)
const getNotificationsProvider = GetNotificationsNotifierProvider._();

final class GetNotificationsNotifierProvider
    extends $NotifierProvider<GetNotificationsNotifier, GetNotificationsState> {
  const GetNotificationsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNotificationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNotificationsNotifierHash();

  @$internal
  @override
  GetNotificationsNotifier create() => GetNotificationsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNotificationsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNotificationsState>(value),
    );
  }
}

String _$getNotificationsNotifierHash() =>
    r'6bc9092073bf68e428e09a3c6c4ed048267339dd';

abstract class _$GetNotificationsNotifier
    extends $Notifier<GetNotificationsState> {
  GetNotificationsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetNotificationsState, GetNotificationsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetNotificationsState, GetNotificationsState>,
              GetNotificationsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
