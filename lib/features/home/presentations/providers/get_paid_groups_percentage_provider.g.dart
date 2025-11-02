// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_paid_groups_percentage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPaidGroupsPercentage)
const getPaidGroupsPercentageProvider = GetPaidGroupsPercentageProvider._();

final class GetPaidGroupsPercentageProvider
    extends
        $FunctionalProvider<
          AsyncValue<Result<double?>>,
          Result<double?>,
          FutureOr<Result<double?>>
        >
    with $FutureModifier<Result<double?>>, $FutureProvider<Result<double?>> {
  const GetPaidGroupsPercentageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPaidGroupsPercentageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPaidGroupsPercentageHash();

  @$internal
  @override
  $FutureProviderElement<Result<double?>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Result<double?>> create(Ref ref) {
    return getPaidGroupsPercentage(ref);
  }
}

String _$getPaidGroupsPercentageHash() =>
    r'1b54db196a483d62a96b3e5b1988669e4bc01b08';
