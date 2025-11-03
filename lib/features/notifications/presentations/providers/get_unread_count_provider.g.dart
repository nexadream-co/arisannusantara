// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_unread_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUnreadCount)
const getUnreadCountProvider = GetUnreadCountProvider._();

final class GetUnreadCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const GetUnreadCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUnreadCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUnreadCountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return getUnreadCount(ref);
  }
}

String _$getUnreadCountHash() => r'53c175390657a4abf4c82a41282cd6ae70a9d2f1';
