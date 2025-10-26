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

@ProviderFor(loginGoogleUsecase)
const loginGoogleUsecaseProvider = LoginGoogleUsecaseProvider._();

final class LoginGoogleUsecaseProvider
    extends
        $FunctionalProvider<
          LoginGoogleUsecase,
          LoginGoogleUsecase,
          LoginGoogleUsecase
        >
    with $Provider<LoginGoogleUsecase> {
  const LoginGoogleUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginGoogleUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginGoogleUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginGoogleUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoginGoogleUsecase create(Ref ref) {
    return loginGoogleUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginGoogleUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginGoogleUsecase>(value),
    );
  }
}

String _$loginGoogleUsecaseHash() =>
    r'ecc0d46094a9c1260b7b45bb7eea3291b5d4fb82';

@ProviderFor(registerUserWithEmailPasswordUsecase)
const registerUserWithEmailPasswordUsecaseProvider =
    RegisterUserWithEmailPasswordUsecaseProvider._();

final class RegisterUserWithEmailPasswordUsecaseProvider
    extends
        $FunctionalProvider<
          RegisterUserWithEmailPasswordUsecase,
          RegisterUserWithEmailPasswordUsecase,
          RegisterUserWithEmailPasswordUsecase
        >
    with $Provider<RegisterUserWithEmailPasswordUsecase> {
  const RegisterUserWithEmailPasswordUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerUserWithEmailPasswordUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$registerUserWithEmailPasswordUsecaseHash();

  @$internal
  @override
  $ProviderElement<RegisterUserWithEmailPasswordUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterUserWithEmailPasswordUsecase create(Ref ref) {
    return registerUserWithEmailPasswordUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterUserWithEmailPasswordUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<RegisterUserWithEmailPasswordUsecase>(value),
    );
  }
}

String _$registerUserWithEmailPasswordUsecaseHash() =>
    r'1027859193df51612a733161b29e48746418c25f';

@ProviderFor(sendEmailVerificationUsecase)
const sendEmailVerificationUsecaseProvider =
    SendEmailVerificationUsecaseProvider._();

final class SendEmailVerificationUsecaseProvider
    extends
        $FunctionalProvider<
          SendEmailVerificationUsecase,
          SendEmailVerificationUsecase,
          SendEmailVerificationUsecase
        >
    with $Provider<SendEmailVerificationUsecase> {
  const SendEmailVerificationUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendEmailVerificationUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendEmailVerificationUsecaseHash();

  @$internal
  @override
  $ProviderElement<SendEmailVerificationUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SendEmailVerificationUsecase create(Ref ref) {
    return sendEmailVerificationUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendEmailVerificationUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendEmailVerificationUsecase>(value),
    );
  }
}

String _$sendEmailVerificationUsecaseHash() =>
    r'8a5c211163fa3e30f42bcbc8c1db87c52aaf2e42';

@ProviderFor(sendPasswordResetEmailUsecase)
const sendPasswordResetEmailUsecaseProvider =
    SendPasswordResetEmailUsecaseProvider._();

final class SendPasswordResetEmailUsecaseProvider
    extends
        $FunctionalProvider<
          SendPasswordResetEmailUsecase,
          SendPasswordResetEmailUsecase,
          SendPasswordResetEmailUsecase
        >
    with $Provider<SendPasswordResetEmailUsecase> {
  const SendPasswordResetEmailUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendPasswordResetEmailUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendPasswordResetEmailUsecaseHash();

  @$internal
  @override
  $ProviderElement<SendPasswordResetEmailUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SendPasswordResetEmailUsecase create(Ref ref) {
    return sendPasswordResetEmailUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendPasswordResetEmailUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendPasswordResetEmailUsecase>(
        value,
      ),
    );
  }
}

String _$sendPasswordResetEmailUsecaseHash() =>
    r'58a97da71665fb66b9fdfbbd334768ac4eaff24c';

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
