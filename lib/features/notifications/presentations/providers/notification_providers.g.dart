// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationRepository)
const notificationRepositoryProvider = NotificationRepositoryProvider._();

final class NotificationRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationRepository,
          NotificationRepository,
          NotificationRepository
        >
    with $Provider<NotificationRepository> {
  const NotificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRepository create(Ref ref) {
    return notificationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepository>(value),
    );
  }
}

String _$notificationRepositoryHash() =>
    r'30f9b069679a4dd2537b0e66a71826e8349a5512';

@ProviderFor(getNotificationsUsecase)
const getNotificationsUsecaseProvider = GetNotificationsUsecaseProvider._();

final class GetNotificationsUsecaseProvider
    extends
        $FunctionalProvider<
          GetNotificationsUsecase,
          GetNotificationsUsecase,
          GetNotificationsUsecase
        >
    with $Provider<GetNotificationsUsecase> {
  const GetNotificationsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNotificationsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNotificationsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetNotificationsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetNotificationsUsecase create(Ref ref) {
    return getNotificationsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNotificationsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNotificationsUsecase>(value),
    );
  }
}

String _$getNotificationsUsecaseHash() =>
    r'4c5f7c5fa1b086d30aa7133feec56185cd311bc3';

@ProviderFor(markAllAsReadUsecase)
const markAllAsReadUsecaseProvider = MarkAllAsReadUsecaseProvider._();

final class MarkAllAsReadUsecaseProvider
    extends
        $FunctionalProvider<
          MarkAllAsReadUsecase,
          MarkAllAsReadUsecase,
          MarkAllAsReadUsecase
        >
    with $Provider<MarkAllAsReadUsecase> {
  const MarkAllAsReadUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markAllAsReadUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markAllAsReadUsecaseHash();

  @$internal
  @override
  $ProviderElement<MarkAllAsReadUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MarkAllAsReadUsecase create(Ref ref) {
    return markAllAsReadUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkAllAsReadUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkAllAsReadUsecase>(value),
    );
  }
}

String _$markAllAsReadUsecaseHash() =>
    r'893f3a924a815eab911db89ddce9428928e9aa9a';

@ProviderFor(getUnreadCountUsecase)
const getUnreadCountUsecaseProvider = GetUnreadCountUsecaseProvider._();

final class GetUnreadCountUsecaseProvider
    extends
        $FunctionalProvider<
          GetUnreadCountUsecase,
          GetUnreadCountUsecase,
          GetUnreadCountUsecase
        >
    with $Provider<GetUnreadCountUsecase> {
  const GetUnreadCountUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUnreadCountUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUnreadCountUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetUnreadCountUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetUnreadCountUsecase create(Ref ref) {
    return getUnreadCountUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUnreadCountUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUnreadCountUsecase>(value),
    );
  }
}

String _$getUnreadCountUsecaseHash() =>
    r'706e2235730cfdb3f6a1790a6d2c7b7a9c75bbe2';
