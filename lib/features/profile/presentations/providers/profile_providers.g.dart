// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileRepository)
const profileRepositoryProvider = ProfileRepositoryProvider._();

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  const ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'2a010f6ed5ff032b91d9ec4959a43cafd642cf2b';

@ProviderFor(deleteAccountUsecase)
const deleteAccountUsecaseProvider = DeleteAccountUsecaseProvider._();

final class DeleteAccountUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteAccountUsecase,
          DeleteAccountUsecase,
          DeleteAccountUsecase
        >
    with $Provider<DeleteAccountUsecase> {
  const DeleteAccountUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteAccountUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteAccountUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteAccountUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteAccountUsecase create(Ref ref) {
    return deleteAccountUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteAccountUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteAccountUsecase>(value),
    );
  }
}

String _$deleteAccountUsecaseHash() =>
    r'65d789caf384d6be96da413e93e053a3c00cffa9';

@ProviderFor(editProfileUsecase)
const editProfileUsecaseProvider = EditProfileUsecaseProvider._();

final class EditProfileUsecaseProvider
    extends
        $FunctionalProvider<
          EditProfileUsecase,
          EditProfileUsecase,
          EditProfileUsecase
        >
    with $Provider<EditProfileUsecase> {
  const EditProfileUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editProfileUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editProfileUsecaseHash();

  @$internal
  @override
  $ProviderElement<EditProfileUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EditProfileUsecase create(Ref ref) {
    return editProfileUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditProfileUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditProfileUsecase>(value),
    );
  }
}

String _$editProfileUsecaseHash() =>
    r'ee41e88f2ec583bd10ae30a173014045ad950e29';

@ProviderFor(updatePasswordUsecase)
const updatePasswordUsecaseProvider = UpdatePasswordUsecaseProvider._();

final class UpdatePasswordUsecaseProvider
    extends
        $FunctionalProvider<
          UpdatePasswordUsecase,
          UpdatePasswordUsecase,
          UpdatePasswordUsecase
        >
    with $Provider<UpdatePasswordUsecase> {
  const UpdatePasswordUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updatePasswordUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updatePasswordUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdatePasswordUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdatePasswordUsecase create(Ref ref) {
    return updatePasswordUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdatePasswordUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdatePasswordUsecase>(value),
    );
  }
}

String _$updatePasswordUsecaseHash() =>
    r'a3279dbb11583287b09021135124d2ed406f3b9e';
