import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../config/enums/feedback_status_enum.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../domain/entities/feedback_entity.dart';
import '../providers/feedback_providers.dart';
import '../providers/get_feedbacks_notifier.dart';

class FeedbackPage extends ConsumerStatefulWidget {
  const FeedbackPage({super.key});

  @override
  ConsumerState<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends ConsumerState<FeedbackPage> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);
  FeedbackStatusEnum _selectedFeedbackStatus = FeedbackStatusEnum.process;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
  }

  void _refresh() {
    ref.read(getFeedbacksProvider.notifier).reset();
    ref
        .read(getFeedbacksProvider.notifier)
        .fetchFeedbacks(
          status: _selectedFeedbackStatus,
          search: _searchController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: context.spacing.md),
                padding: EdgeInsets.all(context.spacing.lg),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(context.assets.textureBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feedback',
                        maxLines: 1,
                        style: context.textStyles.header,
                      ),
                      Text(
                        'Semua feedback yang diberikan pengguna',
                        maxLines: 1,
                        style: context.textStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    _debouncer.run(() {
                      _refresh();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Cari feedback...",
                    hintStyle: context.textStyles.subtitle,
                    fillColor: context.colors.surface,
                    filled: true,
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    suffixIcon: Icon(
                      Icons.search,
                      color: context.colors.textPrimary,
                    ),
                  ),
                ),
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: context.spacing.lg,
                      top: context.spacing.md,
                    ),
                    height: context.appSize.s32,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.lg,
                      ),
                      itemCount: FeedbackStatusEnum.values.length,
                      itemBuilder: (context, index) {
                        final status = FeedbackStatusEnum.values[index];
                        final isSelected = _selectedFeedbackStatus == status;

                        return GestureDetector(
                          onTap: () {
                            setState(() => _selectedFeedbackStatus = status);
                            _refresh();
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              right:
                                  index != FeedbackStatusEnum.values.length - 1
                                  ? context.spacing.sm
                                  : 0,
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.md,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? context.colors.secondary
                                  : Colors.transparent,
                              border: Border.all(
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
                      },
                    ),
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(getFeedbacksProvider);
                  final notifier = ref.read(getFeedbacksProvider.notifier);
                  return Column(
                    children: [
                      if (state.feedbacks.isNotEmpty)
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(
                            left: context.spacing.lg,
                            right: context.spacing.lg,
                          ),
                          shrinkWrap: true,
                          itemCount: state.feedbacks.length,
                          itemBuilder: (context, index) {
                            final feedback = state.feedbacks[index];
                            return GestureDetector(
                              onTap: () {
                                _detailFeedback(feedback);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: context.spacing.md,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.spacing.sm,
                                  vertical: context.spacing.md,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: context.colors.surface,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    context.radius.medium,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              context.colors.surface,
                                          child: Icon(
                                            Icons.chat_outlined,
                                            color: context.colors.primary,
                                          ),
                                        ),
                                        SizedBox(width: context.spacing.sm),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                feedback.title ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: context.textStyles.body
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                feedback.user?.email ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: context.textStyles.body,
                                              ),
                                              SizedBox(
                                                height: context.spacing.sm,
                                              ),
                                              Wrap(
                                                children: [
                                                  Text(
                                                    feedback.user?.name ?? '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .subtitleSmall
                                                        .copyWith(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    width: context.spacing.md,
                                                  ),
                                                  Text(
                                                    feedback
                                                            .createdAt
                                                            ?.toIdDateTime ??
                                                        '',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .subtitleSmall
                                                        .copyWith(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          feedback.status
                                                  ?.toFeedbackStatusEnum()
                                                  ?.label ??
                                              '',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    feedback.status ==
                                                        FeedbackStatusEnum
                                                            .done
                                                            .name
                                                    ? context.colors.success
                                                    : feedback.status ==
                                                          FeedbackStatusEnum
                                                              .ignored
                                                              .name
                                                    ? context.colors.error
                                                    : context.colors.warning,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                      if (state.feedbacks.isEmpty && !state.isLoading)
                        Container(
                          margin: EdgeInsets.only(top: context.spacing.lg),
                          alignment: Alignment.center,
                          child: Text(
                            'Feedback tidak ditemukan',
                            style: context.textStyles.body,
                          ),
                        ),

                      if (state.isLoading)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(context.spacing.lg),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (state.hasMore && state.feedbacks.isNotEmpty)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: context.spacing.lg,
                          ),
                          child: OutlinedButton(
                            onPressed: () => notifier.loadMore(
                              status: _selectedFeedbackStatus,
                              search: _searchController.text,
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
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _detailFeedback(FeedbackEntity feedback) {
    FeedbackStatusEnum status =
        feedback.status?.toFeedbackStatusEnum() ?? FeedbackStatusEnum.process;

    showAppModalBottomSheet(
      context: context,
      child: Container(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Header -----
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Feedback',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.title.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  'Masukkan dan kritik yang diberikan pengguna',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.body,
                ),
              ],
            ),

            SizedBox(height: context.appSize.s16),

            // ----- Info -----
            Text('Informasi Feedback', style: context.textStyles.title),
            SizedBox(height: context.spacing.md),
            _groupInformationItem('Judul', feedback.title ?? ''),
            _groupInformationItem('Feedback', feedback.feedback ?? ''),

            // ----- Status Selection -----
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: Text(
                'Status',
                style: context.textStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            StatefulBuilder(
              builder: (context, setState) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: FeedbackStatusEnum.values.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 5,
                  ),
                  itemBuilder: (context, index) {
                    final item = FeedbackStatusEnum.values[index];
                    final isSelected = status == item;

                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isSelected,
                      onChanged: (_) {
                        setState(() => status = item);
                      },
                      title: Text(item.label),
                    );
                  },
                );
              },
            ),

            SizedBox(height: context.appSize.s16),

            // ----- Action Buttons -----
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: Row(
                spacing: context.spacing.sm,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      CustomAlert.show(
                        context,
                        title: 'Hapus Feedback',
                        description:
                            'Apakah anda yakin ingin menghapus Feedback ini?',
                        onYes: () async {
                          LoadingOverlay.show(context);
                          ref
                              .read(deleteFeedbackUsecaseProvider)
                              .call(feedbackId: feedback.id!)
                              .then((result) {
                                LoadingOverlay.hide();
                                if (result.isSuccess) {
                                  CustomSnackbar.success(
                                    message: result.resultValue,
                                  );
                                  _refresh();
                                  Navigator.pop(context);
                                } else {
                                  CustomSnackbar.error(
                                    message: result.errorMessage,
                                  );
                                }
                              });
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: context.spacing.md,
                        horizontal: context.spacing.xl,
                      ),
                      foregroundColor: context.colors.error,
                      side: BorderSide(color: context.colors.error, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                    ),
                    child: const Text('Hapus'),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (status == feedback.status?.toFeedbackStatusEnum()) {
                          CustomSnackbar.warning(
                            message: 'Tidak ada perubahan status',
                          );
                          return;
                        }

                        LoadingOverlay.show(context);
                        ref
                            .read(updateStatusFeedbackUsecaseProvider)
                            .call(feedbackId: feedback.id!, newStatus: status)
                            .then((result) {
                              LoadingOverlay.hide();
                              if (result.isSuccess) {
                                CustomSnackbar.success(
                                  message: result.resultValue,
                                );
                                setState(() {
                                  _selectedFeedbackStatus = status;
                                });
                                _refresh();
                                Navigator.pop(context);
                              } else {
                                CustomSnackbar.error(
                                  message: result.errorMessage,
                                );
                              }
                            });
                      },
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _groupInformationItem(String label, String value) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.sm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textStyles.body)),
          Text(
            value,
            style: context.textStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
