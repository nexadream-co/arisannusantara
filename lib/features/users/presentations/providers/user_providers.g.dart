// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'8366fba5ac0d6b90c6a637882d24c5e759a5a92f';

@ProviderFor(getUsersUsecase)
const getUsersUsecaseProvider = GetUsersUsecaseProvider._();

final class GetUsersUsecaseProvider
    extends
        $FunctionalProvider<GetUsersUsecase, GetUsersUsecase, GetUsersUsecase>
    with $Provider<GetUsersUsecase> {
  const GetUsersUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUsersUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUsersUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetUsersUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUsersUsecase create(Ref ref) {
    return getUsersUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUsersUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUsersUsecase>(value),
    );
  }
}

String _$getUsersUsecaseHash() => r'4cc763330005d7e27a29c57b2b32cb33e6780422';

@ProviderFor(createUserUsecase)
const createUserUsecaseProvider = CreateUserUsecaseProvider._();

final class CreateUserUsecaseProvider
    extends
        $FunctionalProvider<
          CreateUserUsecase,
          CreateUserUsecase,
          CreateUserUsecase
        >
    with $Provider<CreateUserUsecase> {
  const CreateUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateUserUsecase create(Ref ref) {
    return createUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateUserUsecase>(value),
    );
  }
}

String _$createUserUsecaseHash() => r'2571a942f8594e93818dcb1ca0c413974b010a4e';

@ProviderFor(updateUserUsecase)
const updateUserUsecaseProvider = UpdateUserUsecaseProvider._();

final class UpdateUserUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateUserUsecase,
          UpdateUserUsecase,
          UpdateUserUsecase
        >
    with $Provider<UpdateUserUsecase> {
  const UpdateUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateUserUsecase create(Ref ref) {
    return updateUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateUserUsecase>(value),
    );
  }
}

String _$updateUserUsecaseHash() => r'7bfb630e7952c83e98703858654f9ae5992f165f';

@ProviderFor(deleteUserUsecase)
const deleteUserUsecaseProvider = DeleteUserUsecaseProvider._();

final class DeleteUserUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteUserUsecase,
          DeleteUserUsecase,
          DeleteUserUsecase
        >
    with $Provider<DeleteUserUsecase> {
  const DeleteUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteUserUsecase create(Ref ref) {
    return deleteUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteUserUsecase>(value),
    );
  }
}

String _$deleteUserUsecaseHash() => r'20fd63aed4733939e29b78b3f1cd65ba0061eb92';
