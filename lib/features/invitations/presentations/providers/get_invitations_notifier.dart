import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/invitation_entity.dart';
import 'invitation_providers.dart';

part 'get_invitations_notifier.g.dart';

class GetInvitationsState {
  final List<InvitationEntity> invitations;
  final bool isLoading;
  final bool hasMore;
  final String? lastId;
  final String? error;

  const GetInvitationsState({
    this.invitations = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.lastId,
    this.error,
  });

  GetInvitationsState copyWith({
    List<InvitationEntity>? invitations,
    bool? isLoading,
    bool? hasMore,
    String? lastId,
    String? error,
  }) {
    return GetInvitationsState(
      invitations: invitations ?? this.invitations,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      lastId: lastId ?? this.lastId,
      error: error,
    );
  }
}

@riverpod
class GetInvitationsNotifier extends _$GetInvitationsNotifier {
  @override
  GetInvitationsState build() => const GetInvitationsState();

  Future<void> fetchInvitations({
    required String status,
    required bool forOwner,
  }) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    final usecase = ref.read(getInvitationsUsecaseProvider);
    final result = await usecase(
      status: status,
      forOwner: forOwner,
      lastId: state.lastId,
    );

    if (result.isSuccess) {
      final invitations = result.resultValue ?? [];
      final hasMore = invitations.length >= 10;
      final lastId = invitations.isNotEmpty
          ? invitations.last.id
          : state.lastId;

      state = state.copyWith(
        invitations: [...state.invitations, ...invitations],
        isLoading: false,
        hasMore: hasMore,
        lastId: lastId,
      );
    } else {
      state = state.copyWith(isLoading: false, error: result.errorMessage);
    }
  }

  Future<void> loadMore({
    required String status,
    required bool forOwner,
  }) async {
    if (!state.hasMore || state.isLoading) return;
    await fetchInvitations(status: status, forOwner: forOwner);
  }

  void reset() {
    state = const GetInvitationsState();
  }
}
