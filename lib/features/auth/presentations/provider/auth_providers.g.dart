// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'19a3485653561ac2f781b997131430c5659286d1';

@ProviderFor(loginEmailPasswordUsecase)
const loginEmailPasswordUsecaseProvider = LoginEmailPasswordUsecaseProvider._();

final class LoginEmailPasswordUsecaseProvider
    extends
        $FunctionalProvider<
          LoginEmailPasswordUsecase,
          LoginEmailPasswordUsecase,
          LoginEmailPasswordUsecase
        >
    with $Provider<LoginEmailPasswordUsecase> {
  const LoginEmailPasswordUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginEmailPasswordUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginEmailPasswordUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginEmailPasswordUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoginEmailPasswordUsecase create(Ref ref) {
    return loginEmailPasswordUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginEmailPasswordUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginEmailPasswordUsecase>(value),
    );
  }
}

String _$loginEmailPasswordUsecaseHash() =>
    r'f37f5452d06a928adb3da9aa3ba51218ebfaca71';

@ProviderFor(logoutUsecase)
const logoutUsecaseProvider = LogoutUsecaseProvider._();

final class LogoutUsecaseProvider
    extends $FunctionalProvider<LogoutUsecase, LogoutUsecase, LogoutUsecase>
    with $Provider<LogoutUsecase> {
  const LogoutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUsecaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUsecase create(Ref ref) {
    return logoutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUsecase>(value),
    );
  }
}

String _$logoutUsecaseHash() => r'cf34b81b5640c91a5b0295a5e8575e5e7cbc8be6';
