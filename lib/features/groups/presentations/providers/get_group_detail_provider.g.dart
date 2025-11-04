// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_group_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getGroupDetail)
const getGroupDetailProvider = GetGroupDetailFamily._();

final class GetGroupDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<GroupEntity>>,
          Result<GroupEntity>,
          FutureOr<Result<GroupEntity>>
        >
    with
        $FutureModifier<Result<GroupEntity>>,
        $FutureProvider<Result<GroupEntity>> {
  const GetGroupDetailProvider._({
    required GetGroupDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getGroupDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getGroupDetailHash();

  @override
  String toString() {
    return r'getGroupDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Result<GroupEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<GroupEntity>> create(Ref ref) {
    final argument = this.argument as String;
    return getGroupDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGroupDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getGroupDetailHash() => r'3e493a2bdfa04ebdf69da6c1ac3d251bf7306fcf';

final class GetGroupDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Result<GroupEntity>>, String> {
  const GetGroupDetailFamily._()
    : super(
        retry: null,
        name: r'getGroupDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetGroupDetailProvider call(String groupId) =>
      GetGroupDetailProvider._(argument: groupId, from: this);

  @override
  String toString() => r'getGroupDetailProvider';
}
