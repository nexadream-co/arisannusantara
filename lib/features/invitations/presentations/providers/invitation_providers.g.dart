// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(invitationRepository)
const invitationRepositoryProvider = InvitationRepositoryProvider._();

final class InvitationRepositoryProvider
    extends
        $FunctionalProvider<
          InvitationRepository,
          InvitationRepository,
          InvitationRepository
        >
    with $Provider<InvitationRepository> {
  const InvitationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'invitationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invitationRepositoryHash();

  @$internal
  @override
  $ProviderElement<InvitationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InvitationRepository create(Ref ref) {
    return invitationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvitationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvitationRepository>(value),
    );
  }
}

String _$invitationRepositoryHash() =>
    r'55a2043afa76c47076575dc708ff5313e43baf83';

@ProviderFor(getInvitationsUsecase)
const getInvitationsUsecaseProvider = GetInvitationsUsecaseProvider._();

final class GetInvitationsUsecaseProvider
    extends
        $FunctionalProvider<
          GetInvitationsUsecase,
          GetInvitationsUsecase,
          GetInvitationsUsecase
        >
    with $Provider<GetInvitationsUsecase> {
  const GetInvitationsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getInvitationsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getInvitationsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetInvitationsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetInvitationsUsecase create(Ref ref) {
    return getInvitationsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetInvitationsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetInvitationsUsecase>(value),
    );
  }
}

String _$getInvitationsUsecaseHash() =>
    r'6401785566f31151e582d0c3b7f1172165a5f32a';

@ProviderFor(createInvitationUsecase)
const createInvitationUsecaseProvider = CreateInvitationUsecaseProvider._();

final class CreateInvitationUsecaseProvider
    extends
        $FunctionalProvider<
          CreateInvitationUsecase,
          CreateInvitationUsecase,
          CreateInvitationUsecase
        >
    with $Provider<CreateInvitationUsecase> {
  const CreateInvitationUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createInvitationUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createInvitationUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateInvitationUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateInvitationUsecase create(Ref ref) {
    return createInvitationUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateInvitationUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateInvitationUsecase>(value),
    );
  }
}

String _$createInvitationUsecaseHash() =>
    r'293e52721445fb800c9f32983b475c398cb05f04';

@ProviderFor(createInvitationByGroupCodeUsecase)
const createInvitationByGroupCodeUsecaseProvider =
    CreateInvitationByGroupCodeUsecaseProvider._();

final class CreateInvitationByGroupCodeUsecaseProvider
    extends
        $FunctionalProvider<
          CreateInvitationByGroupCodeUsecase,
          CreateInvitationByGroupCodeUsecase,
          CreateInvitationByGroupCodeUsecase
        >
    with $Provider<CreateInvitationByGroupCodeUsecase> {
  const CreateInvitationByGroupCodeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createInvitationByGroupCodeUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$createInvitationByGroupCodeUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateInvitationByGroupCodeUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateInvitationByGroupCodeUsecase create(Ref ref) {
    return createInvitationByGroupCodeUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateInvitationByGroupCodeUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateInvitationByGroupCodeUsecase>(
        value,
      ),
    );
  }
}

String _$createInvitationByGroupCodeUsecaseHash() =>
    r'ac016e9089bfaf94d63f1c93b5760d60ec54af5f';

@ProviderFor(updateInvitationStatusUsecase)
const updateInvitationStatusUsecaseProvider =
    UpdateInvitationStatusUsecaseProvider._();

final class UpdateInvitationStatusUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateInvitationStatusUsecase,
          UpdateInvitationStatusUsecase,
          UpdateInvitationStatusUsecase
        >
    with $Provider<UpdateInvitationStatusUsecase> {
  const UpdateInvitationStatusUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateInvitationStatusUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateInvitationStatusUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateInvitationStatusUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateInvitationStatusUsecase create(Ref ref) {
    return updateInvitationStatusUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateInvitationStatusUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateInvitationStatusUsecase>(
        value,
      ),
    );
  }
}

String _$updateInvitationStatusUsecaseHash() =>
    r'a9153de70e7023f929b7874a6ace06949b1a46d5';
