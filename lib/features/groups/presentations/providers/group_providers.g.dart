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

String _$getGroupsUsecaseHash() => r'557ac47c5db2d35ff0582e67f9ec2089e2c9776d';

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
    r'dad4c3a5874835fc45e2face73a61fccd233c0e6';

@ProviderFor(updateGroupUsecase)
const updateGroupUsecaseProvider = UpdateGroupUsecaseProvider._();

final class UpdateGroupUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateGroupUsecase,
          UpdateGroupUsecase,
          UpdateGroupUsecase
        >
    with $Provider<UpdateGroupUsecase> {
  const UpdateGroupUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateGroupUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateGroupUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateGroupUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateGroupUsecase create(Ref ref) {
    return updateGroupUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateGroupUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateGroupUsecase>(value),
    );
  }
}

String _$updateGroupUsecaseHash() =>
    r'ecb9708daa59cc12189ab294db04f4a8a04f29ef';

@ProviderFor(deleteGroupUsecase)
const deleteGroupUsecaseProvider = DeleteGroupUsecaseProvider._();

final class DeleteGroupUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteGroupUsecase,
          DeleteGroupUsecase,
          DeleteGroupUsecase
        >
    with $Provider<DeleteGroupUsecase> {
  const DeleteGroupUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteGroupUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteGroupUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteGroupUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteGroupUsecase create(Ref ref) {
    return deleteGroupUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteGroupUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteGroupUsecase>(value),
    );
  }
}

String _$deleteGroupUsecaseHash() =>
    r'450b5987bb3fa8842f861098b9966e51947247f2';

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
    r'333490da734969485e79daf46e347101a3225859';

@ProviderFor(getGroupDetailByCodeUsecase)
const getGroupDetailByCodeUsecaseProvider =
    GetGroupDetailByCodeUsecaseProvider._();

final class GetGroupDetailByCodeUsecaseProvider
    extends
        $FunctionalProvider<
          GetGroupDetailByCodeUsecase,
          GetGroupDetailByCodeUsecase,
          GetGroupDetailByCodeUsecase
        >
    with $Provider<GetGroupDetailByCodeUsecase> {
  const GetGroupDetailByCodeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGroupDetailByCodeUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGroupDetailByCodeUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetGroupDetailByCodeUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetGroupDetailByCodeUsecase create(Ref ref) {
    return getGroupDetailByCodeUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGroupDetailByCodeUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGroupDetailByCodeUsecase>(value),
    );
  }
}

String _$getGroupDetailByCodeUsecaseHash() =>
    r'5a2b16c40fb5329ea866ffc483eda6b75f088525';

@ProviderFor(getGroupOwnersByCodeUsecase)
const getGroupOwnersByCodeUsecaseProvider =
    GetGroupOwnersByCodeUsecaseProvider._();

final class GetGroupOwnersByCodeUsecaseProvider
    extends
        $FunctionalProvider<
          GetGroupOwnersByCodeUsecase,
          GetGroupOwnersByCodeUsecase,
          GetGroupOwnersByCodeUsecase
        >
    with $Provider<GetGroupOwnersByCodeUsecase> {
  const GetGroupOwnersByCodeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGroupOwnersByCodeUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGroupOwnersByCodeUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetGroupOwnersByCodeUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetGroupOwnersByCodeUsecase create(Ref ref) {
    return getGroupOwnersByCodeUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGroupOwnersByCodeUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGroupOwnersByCodeUsecase>(value),
    );
  }
}

String _$getGroupOwnersByCodeUsecaseHash() =>
    r'92d85750f76437a3dae2e1c603b3da07ca689d17';

@ProviderFor(getGroupOwners)
const getGroupOwnersProvider = GetGroupOwnersFamily._();

final class GetGroupOwnersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<List<UserEntity>>>,
          Result<List<UserEntity>>,
          FutureOr<Result<List<UserEntity>>>
        >
    with
        $FutureModifier<Result<List<UserEntity>>>,
        $FutureProvider<Result<List<UserEntity>>> {
  const GetGroupOwnersProvider._({
    required GetGroupOwnersFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getGroupOwnersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getGroupOwnersHash();

  @override
  String toString() {
    return r'getGroupOwnersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<List<UserEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<List<UserEntity>>> create(Ref ref) {
    final argument = this.argument as String;
    return getGroupOwners(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGroupOwnersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getGroupOwnersHash() => r'2d558604049d460d7ec44a75e763f6cc4bf30545';

final class GetGroupOwnersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<List<UserEntity>>>, String> {
  const GetGroupOwnersFamily._()
    : super(
        retry: null,
        name: r'getGroupOwnersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetGroupOwnersProvider call(String groupId) =>
      GetGroupOwnersProvider._(argument: groupId, from: this);

  @override
  String toString() => r'getGroupOwnersProvider';
}

@ProviderFor(getMembers)
const getMembersProvider = GetMembersFamily._();

final class GetMembersProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<List<MemberEntity>>>,
          Result<List<MemberEntity>>,
          FutureOr<Result<List<MemberEntity>>>
        >
    with
        $FutureModifier<Result<List<MemberEntity>>>,
        $FutureProvider<Result<List<MemberEntity>>> {
  const GetMembersProvider._({
    required GetMembersFamily super.from,
    required (
      String,
      String?, {
      bool? isActive,
      PaymentStatusEnum? paymentStatus,
      bool? hasReward,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'getMembersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getMembersHash();

  @override
  String toString() {
    return r'getMembersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Result<List<MemberEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<List<MemberEntity>>> create(Ref ref) {
    final argument =
        this.argument
            as (
              String,
              String?, {
              bool? isActive,
              PaymentStatusEnum? paymentStatus,
              bool? hasReward,
            });
    return getMembers(
      ref,
      argument.$1,
      argument.$2,
      isActive: argument.isActive,
      paymentStatus: argument.paymentStatus,
      hasReward: argument.hasReward,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetMembersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMembersHash() => r'c561f7e945c45b6bc4718fc3fc842783882d7143';

final class GetMembersFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Result<List<MemberEntity>>>,
          (
            String,
            String?, {
            bool? isActive,
            PaymentStatusEnum? paymentStatus,
            bool? hasReward,
          })
        > {
  const GetMembersFamily._()
    : super(
        retry: null,
        name: r'getMembersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetMembersProvider call(
    String groupId,
    String? search, {
    bool? isActive,
    PaymentStatusEnum? paymentStatus,
    bool? hasReward,
  }) => GetMembersProvider._(
    argument: (
      groupId,
      search,
      isActive: isActive,
      paymentStatus: paymentStatus,
      hasReward: hasReward,
    ),
    from: this,
  );

  @override
  String toString() => r'getMembersProvider';
}

@ProviderFor(checkEligibleToShuffle)
const checkEligibleToShuffleProvider = CheckEligibleToShuffleFamily._();

final class CheckEligibleToShuffleProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<bool>>,
          Result<bool>,
          FutureOr<Result<bool>>
        >
    with $FutureModifier<Result<bool>>, $FutureProvider<Result<bool>> {
  const CheckEligibleToShuffleProvider._({
    required CheckEligibleToShuffleFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'checkEligibleToShuffleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checkEligibleToShuffleHash();

  @override
  String toString() {
    return r'checkEligibleToShuffleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<bool>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<bool>> create(Ref ref) {
    final argument = this.argument as String;
    return checkEligibleToShuffle(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckEligibleToShuffleProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checkEligibleToShuffleHash() =>
    r'c04523ec551aee8bd9c1350c6079aa405629c791';

final class CheckEligibleToShuffleFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<bool>>, String> {
  const CheckEligibleToShuffleFamily._()
    : super(
        retry: null,
        name: r'checkEligibleToShuffleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CheckEligibleToShuffleProvider call(String groupId) =>
      CheckEligibleToShuffleProvider._(argument: groupId, from: this);

  @override
  String toString() => r'checkEligibleToShuffleProvider';
}

@ProviderFor(getHistories)
const getHistoriesProvider = GetHistoriesFamily._();

final class GetHistoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<List<HistoryEntity>>>,
          Result<List<HistoryEntity>>,
          FutureOr<Result<List<HistoryEntity>>>
        >
    with
        $FutureModifier<Result<List<HistoryEntity>>>,
        $FutureProvider<Result<List<HistoryEntity>>> {
  const GetHistoriesProvider._({
    required GetHistoriesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getHistoriesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getHistoriesHash();

  @override
  String toString() {
    return r'getHistoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<List<HistoryEntity>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<List<HistoryEntity>>> create(Ref ref) {
    final argument = this.argument as String;
    return getHistories(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHistoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getHistoriesHash() => r'53431612f04901c86cec794c04061c5945650a6f';

final class GetHistoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Result<List<HistoryEntity>>>,
          String
        > {
  const GetHistoriesFamily._()
    : super(
        retry: null,
        name: r'getHistoriesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetHistoriesProvider call(String groupId) =>
      GetHistoriesProvider._(argument: groupId, from: this);

  @override
  String toString() => r'getHistoriesProvider';
}

@ProviderFor(getTotalGroupPaidAmount)
const getTotalGroupPaidAmountProvider = GetTotalGroupPaidAmountFamily._();

final class GetTotalGroupPaidAmountProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<num>>,
          Result<num>,
          FutureOr<Result<num>>
        >
    with $FutureModifier<Result<num>>, $FutureProvider<Result<num>> {
  const GetTotalGroupPaidAmountProvider._({
    required GetTotalGroupPaidAmountFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getTotalGroupPaidAmountProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getTotalGroupPaidAmountHash();

  @override
  String toString() {
    return r'getTotalGroupPaidAmountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<num>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<num>> create(Ref ref) {
    final argument = this.argument as String;
    return getTotalGroupPaidAmount(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalGroupPaidAmountProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getTotalGroupPaidAmountHash() =>
    r'db86fb2cc0c4f2d69d75990abb5b039d78d6ef1c';

final class GetTotalGroupPaidAmountFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<num>>, String> {
  const GetTotalGroupPaidAmountFamily._()
    : super(
        retry: null,
        name: r'getTotalGroupPaidAmountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetTotalGroupPaidAmountProvider call(String groupId) =>
      GetTotalGroupPaidAmountProvider._(argument: groupId, from: this);

  @override
  String toString() => r'getTotalGroupPaidAmountProvider';
}

@ProviderFor(createHistoryUsecase)
const createHistoryUsecaseProvider = CreateHistoryUsecaseProvider._();

final class CreateHistoryUsecaseProvider
    extends
        $FunctionalProvider<
          CreateHistoryUsecase,
          CreateHistoryUsecase,
          CreateHistoryUsecase
        >
    with $Provider<CreateHistoryUsecase> {
  const CreateHistoryUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createHistoryUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createHistoryUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateHistoryUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateHistoryUsecase create(Ref ref) {
    return createHistoryUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateHistoryUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateHistoryUsecase>(value),
    );
  }
}

String _$createHistoryUsecaseHash() =>
    r'8c5608e73decfb170529aa0847155ec3be2eb63d';

@ProviderFor(getMemberDetail)
const getMemberDetailProvider = GetMemberDetailFamily._();

final class GetMemberDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<MemberEntity>>,
          Result<MemberEntity>,
          FutureOr<Result<MemberEntity>>
        >
    with
        $FutureModifier<Result<MemberEntity>>,
        $FutureProvider<Result<MemberEntity>> {
  const GetMemberDetailProvider._({
    required GetMemberDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getMemberDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getMemberDetailHash();

  @override
  String toString() {
    return r'getMemberDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<MemberEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<MemberEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return getMemberDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMemberDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMemberDetailHash() => r'51163d54721e3fdbafa8c685274c9445d6d7fc0b';

final class GetMemberDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<MemberEntity>>, String> {
  const GetMemberDetailFamily._()
    : super(
        retry: null,
        name: r'getMemberDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetMemberDetailProvider call(String memberId) =>
      GetMemberDetailProvider._(argument: memberId, from: this);

  @override
  String toString() => r'getMemberDetailProvider';
}

@ProviderFor(createMemberUsecase)
const createMemberUsecaseProvider = CreateMemberUsecaseProvider._();

final class CreateMemberUsecaseProvider
    extends
        $FunctionalProvider<
          CreateMemberUsecase,
          CreateMemberUsecase,
          CreateMemberUsecase
        >
    with $Provider<CreateMemberUsecase> {
  const CreateMemberUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createMemberUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createMemberUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateMemberUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateMemberUsecase create(Ref ref) {
    return createMemberUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateMemberUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateMemberUsecase>(value),
    );
  }
}

String _$createMemberUsecaseHash() =>
    r'61e250b6775520891a2438f47f44ab3efa85777c';

@ProviderFor(updateMemberUsecase)
const updateMemberUsecaseProvider = UpdateMemberUsecaseProvider._();

final class UpdateMemberUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateMemberUsecase,
          UpdateMemberUsecase,
          UpdateMemberUsecase
        >
    with $Provider<UpdateMemberUsecase> {
  const UpdateMemberUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateMemberUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateMemberUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateMemberUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateMemberUsecase create(Ref ref) {
    return updateMemberUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateMemberUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateMemberUsecase>(value),
    );
  }
}

String _$updateMemberUsecaseHash() =>
    r'931236548a4c0ced203e311cd130e7d04011a750';

@ProviderFor(deleteMemberUsecase)
const deleteMemberUsecaseProvider = DeleteMemberUsecaseProvider._();

final class DeleteMemberUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteMemberUsecase,
          DeleteMemberUsecase,
          DeleteMemberUsecase
        >
    with $Provider<DeleteMemberUsecase> {
  const DeleteMemberUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteMemberUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteMemberUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteMemberUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteMemberUsecase create(Ref ref) {
    return deleteMemberUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteMemberUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteMemberUsecase>(value),
    );
  }
}

String _$deleteMemberUsecaseHash() =>
    r'cf3ea1b100615d052873d13e320a429fdaad9a75';

@ProviderFor(addPaymentAccountUsecase)
const addPaymentAccountUsecaseProvider = AddPaymentAccountUsecaseProvider._();

final class AddPaymentAccountUsecaseProvider
    extends
        $FunctionalProvider<
          AddPaymentAccountUsecase,
          AddPaymentAccountUsecase,
          AddPaymentAccountUsecase
        >
    with $Provider<AddPaymentAccountUsecase> {
  const AddPaymentAccountUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addPaymentAccountUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addPaymentAccountUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddPaymentAccountUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddPaymentAccountUsecase create(Ref ref) {
    return addPaymentAccountUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddPaymentAccountUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddPaymentAccountUsecase>(value),
    );
  }
}

String _$addPaymentAccountUsecaseHash() =>
    r'4d4be30fa1ecf716099038e1a01c6fe4534ccbf6';

@ProviderFor(updatePaymentAccountUsecase)
const updatePaymentAccountUsecaseProvider =
    UpdatePaymentAccountUsecaseProvider._();

final class UpdatePaymentAccountUsecaseProvider
    extends
        $FunctionalProvider<
          UpdatePaymentAccountUsecase,
          UpdatePaymentAccountUsecase,
          UpdatePaymentAccountUsecase
        >
    with $Provider<UpdatePaymentAccountUsecase> {
  const UpdatePaymentAccountUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePaymentAccountUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePaymentAccountUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdatePaymentAccountUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdatePaymentAccountUsecase create(Ref ref) {
    return updatePaymentAccountUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdatePaymentAccountUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdatePaymentAccountUsecase>(value),
    );
  }
}

String _$updatePaymentAccountUsecaseHash() =>
    r'a8c183ce729d9542573728b7c940659931148532';

@ProviderFor(deletePaymentAccountUsecase)
const deletePaymentAccountUsecaseProvider =
    DeletePaymentAccountUsecaseProvider._();

final class DeletePaymentAccountUsecaseProvider
    extends
        $FunctionalProvider<
          DeletePaymentAccountUsecase,
          DeletePaymentAccountUsecase,
          DeletePaymentAccountUsecase
        >
    with $Provider<DeletePaymentAccountUsecase> {
  const DeletePaymentAccountUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletePaymentAccountUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletePaymentAccountUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeletePaymentAccountUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeletePaymentAccountUsecase create(Ref ref) {
    return deletePaymentAccountUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeletePaymentAccountUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeletePaymentAccountUsecase>(value),
    );
  }
}

String _$deletePaymentAccountUsecaseHash() =>
    r'dc4e36f5d858f9b040338e608e506455ede31b78';

@ProviderFor(addGroupOwnersUsecase)
const addGroupOwnersUsecaseProvider = AddGroupOwnersUsecaseProvider._();

final class AddGroupOwnersUsecaseProvider
    extends
        $FunctionalProvider<
          AddGroupOwnersUsecase,
          AddGroupOwnersUsecase,
          AddGroupOwnersUsecase
        >
    with $Provider<AddGroupOwnersUsecase> {
  const AddGroupOwnersUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addGroupOwnersUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addGroupOwnersUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddGroupOwnersUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddGroupOwnersUsecase create(Ref ref) {
    return addGroupOwnersUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddGroupOwnersUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddGroupOwnersUsecase>(value),
    );
  }
}

String _$addGroupOwnersUsecaseHash() =>
    r'fc147049ef69b68ce70ea908d3eff7460aea18ae';

@ProviderFor(removeGroupOwnerUsecase)
const removeGroupOwnerUsecaseProvider = RemoveGroupOwnerUsecaseProvider._();

final class RemoveGroupOwnerUsecaseProvider
    extends
        $FunctionalProvider<
          RemoveGroupOwnerUsecase,
          RemoveGroupOwnerUsecase,
          RemoveGroupOwnerUsecase
        >
    with $Provider<RemoveGroupOwnerUsecase> {
  const RemoveGroupOwnerUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeGroupOwnerUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeGroupOwnerUsecaseHash();

  @$internal
  @override
  $ProviderElement<RemoveGroupOwnerUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoveGroupOwnerUsecase create(Ref ref) {
    return removeGroupOwnerUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoveGroupOwnerUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoveGroupOwnerUsecase>(value),
    );
  }
}

String _$removeGroupOwnerUsecaseHash() =>
    r'3eae2db5b221e4f23e49f26306895eb5854155ee';
