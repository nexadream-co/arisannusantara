import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants/app_user_role.dart';
import '../../../../config/enums/invitation_status.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../auth/presentations/provider/auth_state_provider.dart';
import '../../../notifications/domain/entities/notification_entity.dart';
import '../../../notifications/presentations/providers/notification_providers.dart';
import '../../domain/entities/invitation_entity.dart';
import '../providers/get_invitations_notifier.dart';
import '../providers/invitation_providers.dart';

class InvitationPage extends ConsumerStatefulWidget {
  static const String path = '/invitations';
  const InvitationPage({super.key});

  @override
  ConsumerState<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends ConsumerState<InvitationPage> {
  InvitationStatus selectedStatus = InvitationStatus.pending;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      refresh();
    });
  }

  void refresh() {
    final authStateAsync = ref.read(authStateProvider);
    authStateAsync.when(
      data: (user) {
        ref.read(getInvitationsProvider.notifier).reset();
        ref
            .read(getInvitationsProvider.notifier)
            .fetchInvitations(status: selectedStatus.name);
      },
      error: (_, __) => null,
      loading: () => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authStateProvider);
    return auth.when(
      loading: () => Scaffold(body: Center(child: LoadingIconAnimation())),
      error: (_, __) => Scaffold(body: Center(child: LoadingIconAnimation())),
      data: (user) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(context.spacing.lg),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(context.assets.textureBg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Undangan',
                                maxLines: 1,
                                style: context.textStyles.header,
                              ),
                              Text(
                                'Semua undangan peserta',
                                maxLines: 1,
                                style: context.textStyles.body,
                              ),
                            ],
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.info_outlined,
                        //     color: context.colors.textPrimary,
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: context.spacing.lg,
                        ),
                        height: context.appSize.s32,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: context.spacing.lg,
                          ),
                          children: InvitationStatus.values.map((status) {
                            final isSelected = status == selectedStatus;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedStatus = status;
                                });
                                refresh();
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: context.spacing.sm,
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.spacing.md,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? context.colors.secondary
                                      : Colors.transparent,
                                  border: isSelected
                                      ? null
                                      : Border.all(
                                          color: context.colors.secondary,
                                        ),
                                  borderRadius: BorderRadius.circular(
                                    context.radius.medium,
                                  ),
                                ),
                                child: Text(
                                  status.label,
                                  style: context.textStyles.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : context.colors.secondary,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),

                  Consumer(
                    builder: (context, ref, child) {
                      final authStateAsync = ref.watch(authStateProvider);

                      return authStateAsync.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (e, _) => const SizedBox(),
                        data: (user) {
                          return Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(getInvitationsProvider);
                              final notifier = ref.read(
                                getInvitationsProvider.notifier,
                              );

                              return Column(
                                children: [
                                  if (state.invitations.isNotEmpty)
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.only(
                                        left: context.spacing.lg,
                                        right: context.spacing.lg,
                                        bottom: context.spacing.lg,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: state.invitations.length,
                                      itemBuilder: (context, index) {
                                        final invitation =
                                            state.invitations[index];

                                        return Container(
                                          padding: EdgeInsets.only(
                                            bottom: context.spacing.md,
                                          ),
                                          margin: EdgeInsets.only(
                                            bottom: context.spacing.md,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: context.colors.divider,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        context.shadow.small,
                                                      ],
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Text(
                                                        invitation
                                                                .user
                                                                ?.name
                                                                ?.initials ??
                                                            '',
                                                        style: context
                                                            .textStyles
                                                            .body
                                                            .copyWith(
                                                              color: context
                                                                  .colors
                                                                  .primary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: context.spacing.sm,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          invitation
                                                                  .user
                                                                  ?.name ??
                                                              '',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: context
                                                              .textStyles
                                                              .body
                                                              .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: context
                                                                    .colors
                                                                    .primary,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          height: context
                                                              .spacing
                                                              .xs,
                                                        ),
                                                        Text(
                                                          invitation
                                                                  .user
                                                                  ?.email ??
                                                              '',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: context
                                                              .textStyles
                                                              .bodySmall,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (invitation.status ==
                                                      InvitationStatus
                                                          .approved
                                                          .name)
                                                    Text(
                                                      'Disetujui',
                                                      style: context
                                                          .textStyles
                                                          .title
                                                          .copyWith(
                                                            color: context
                                                                .colors
                                                                .success,
                                                          ),
                                                    ),
                                                  if (invitation.status ==
                                                      InvitationStatus
                                                          .rejected
                                                          .name)
                                                    Text(
                                                      'Ditolak',
                                                      style: context
                                                          .textStyles
                                                          .title
                                                          .copyWith(
                                                            color: context
                                                                .colors
                                                                .error,
                                                          ),
                                                    ),
                                                  if (invitation.status ==
                                                          InvitationStatus
                                                              .pending
                                                              .name &&
                                                      !(invitation.groupOwnerIds ??
                                                              [])
                                                          .contains(user?.id))
                                                    Text(
                                                      'Menunggu\nPersetujuan',
                                                      textAlign: TextAlign.end,
                                                      style: context
                                                          .textStyles
                                                          .body
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: context
                                                                .colors
                                                                .warning,
                                                          ),
                                                    ),
                                                  if (invitation.status ==
                                                          InvitationStatus
                                                              .pending
                                                              .name &&
                                                      (invitation.groupOwnerIds ??
                                                              [])
                                                          .contains(user?.id))
                                                    Row(
                                                      children: [
                                                        OutlinedButton(
                                                          onPressed: () {
                                                            updateInvitationStatus(
                                                              invitation:
                                                                  invitation,
                                                              status:
                                                                  InvitationStatus
                                                                      .rejected,
                                                            );
                                                          },
                                                          style: OutlinedButton.styleFrom(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      context
                                                                          .spacing
                                                                          .md,
                                                                  vertical:
                                                                      context
                                                                          .spacing
                                                                          .sm,
                                                                ),
                                                            minimumSize:
                                                                Size.zero,
                                                          ),
                                                          child: Text('Tolak'),
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .spacing
                                                              .sm,
                                                        ),
                                                        FilledButton(
                                                          onPressed: () {
                                                            updateInvitationStatus(
                                                              invitation:
                                                                  invitation,
                                                              status:
                                                                  InvitationStatus
                                                                      .approved,
                                                            );
                                                          },
                                                          style: FilledButton.styleFrom(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      context
                                                                          .spacing
                                                                          .md,
                                                                  vertical:
                                                                      context
                                                                          .spacing
                                                                          .sm,
                                                                ),
                                                            minimumSize:
                                                                Size.zero,
                                                          ),
                                                          child: Text('Terima'),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: context.appSize.s16,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: context.spacing.sm,
                                                  right: context.spacing.sm,
                                                ),
                                                child: Row(
                                                  spacing: context.spacing.xs,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            invitation
                                                                    .group
                                                                    ?.name ??
                                                                '',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: context
                                                                .textStyles
                                                                .bodySmall
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            invitation
                                                                    .group
                                                                    ?.code ??
                                                                '',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: context
                                                                .textStyles
                                                                .bodySmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      invitation
                                                              .createdAt
                                                              ?.toIdDate ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: context
                                                          .textStyles
                                                          .bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),

                                  if (state.invitations.isEmpty &&
                                      !state.isLoading)
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Undangan tidak ditemukan',
                                        style: context.textStyles.body,
                                      ),
                                    ),

                                  if (state.isLoading)
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          context.spacing.lg,
                                        ),
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  else if (state.hasMore &&
                                      state.invitations.isNotEmpty)
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: context.spacing.md,
                                      ),
                                      child: OutlinedButton(
                                        onPressed: () => notifier.loadMore(
                                          status: selectedStatus.name,
                                          forOwner:
                                              user?.role != AppUserRole.user,
                                        ),
                                        child: const Text('Muat Lebih Banyak'),
                                      ),
                                    ),

                                  if (state.error != null)
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          state.error!,
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void updateInvitationStatus({
    required InvitationEntity invitation,
    required InvitationStatus status,
  }) {
    CustomAlert.show(
      context,
      title: 'Terima Permintaan',
      description: 'Apakah anda yakin ingin menerima Permintaan ini?',
      onYes: () async {
        LoadingOverlay.show(context);
        final usecase = ref.read(updateInvitationStatusUsecaseProvider);
        usecase.call(invitationId: invitation.id!, newStatus: status.name).then((
          result,
        ) {
          LoadingOverlay.hide();
          if (result.isSuccess) {
            if (invitation.userId != null) {
              ref
                  .read(createNotificationsUsecaseProvider)
                  .call(
                    userIds: [invitation.userId!],
                    notification: NotificationEntity(
                      title: 'Undangan ${invitation.group?.name}',
                      description:
                          'Status undangan grup ${invitation.group?.name} telah ${status.label.toLowerCase()}',
                      type: 'invitation',
                    ),
                  );
            }

            setState(() {
              selectedStatus = status;
            });
            refresh();
            CustomSnackbar.success(message: result.resultValue);
          } else {
            CustomSnackbar.error(message: result.errorMessage);
          }
        });
      },
    );
  }
}
