// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groupRepository)
const groupRepositoryProvider = GroupRepositoryProvider._();

final class GroupRepositoryProvider
    extends
        $FunctionalProvider<GroupRepository, GroupRepository, GroupRepository>
    with $Provider<GroupRepository> {
  const GroupRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupRepositoryHash();

  @$internal
  @override
  $ProviderElement<GroupRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GroupRepository create(Ref ref) {
    return groupRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroupRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroupRepository>(value),
    );
  }
}

String _$groupRepositoryHash() => r'1c0b7da626de70818de616cf4d78e1bb87e90235';

@ProviderFor(getGroupsUsecase)
const getGroupsUsecaseProvider = GetGroupsUsecaseProvider._();

final class GetGroupsUsecaseProvider
    extends
        $FunctionalProvider<
          GetGroupsUsecase,
          GetGroupsUsecase,
          GetGroupsUsecase
        >
    with $Provider<GetGroupsUsecase> {
  const GetGroupsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGroupsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGroupsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetGroupsUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetGroupsUsecase create(Ref ref) {
    return getGroupsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGroupsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGroupsUsecase>(value),
    );
  }
}

String _$getGroupsUsecaseHash() => r'1af9d85423371180d1aea24c723dbbb9a1131c8b';

@ProviderFor(createGroupUsecase)
const createGroupUsecaseProvider = CreateGroupUsecaseProvider._();

final class CreateGroupUsecaseProvider
    extends
        $FunctionalProvider<
          CreateGroupUsecase,
          CreateGroupUsecase,
          CreateGroupUsecase
        >
    with $Provider<CreateGroupUsecase> {
  const CreateGroupUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createGroupUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createGroupUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateGroupUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateGroupUsecase create(Ref ref) {
    return createGroupUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateGroupUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateGroupUsecase>(value),
    );
  }
}

String _$createGroupUsecaseHash() =>
    r'fb51bd3eb734d00230c3eaf3d63ba8f541b9482e';

@ProviderFor(getGroupDetailUsecase)
const getGroupDetailUsecaseProvider = GetGroupDetailUsecaseProvider._();

final class GetGroupDetailUsecaseProvider
    extends
        $FunctionalProvider<
          GetGroupDetailUsecase,
          GetGroupDetailUsecase,
          GetGroupDetailUsecase
        >
    with $Provider<GetGroupDetailUsecase> {
  const GetGroupDetailUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGroupDetailUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGroupDetailUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetGroupDetailUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetGroupDetailUsecase create(Ref ref) {
    return getGroupDetailUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGroupDetailUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGroupDetailUsecase>(value),
    );
  }
}

String _$getGroupDetailUsecaseHash() =>
    r'3ecec27a184025c9021f5951cd04684a3a152eee';
