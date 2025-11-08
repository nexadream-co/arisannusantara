// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feedbacks_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetFeedbacksNotifier)
const getFeedbacksProvider = GetFeedbacksNotifierProvider._();

final class GetFeedbacksNotifierProvider
    extends $NotifierProvider<GetFeedbacksNotifier, GetFeedbacksState> {
  const GetFeedbacksNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFeedbacksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFeedbacksNotifierHash();

  @$internal
  @override
  GetFeedbacksNotifier create() => GetFeedbacksNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFeedbacksState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFeedbacksState>(value),
    );
  }
}

String _$getFeedbacksNotifierHash() =>
    r'4393c7ae06547f6e5609df364057741b55ecc1ee';

abstract class _$GetFeedbacksNotifier extends $Notifier<GetFeedbacksState> {
  GetFeedbacksState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GetFeedbacksState, GetFeedbacksState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GetFeedbacksState, GetFeedbacksState>,
              GetFeedbacksState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
