import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../providers/get_notifications_notifier.dart';
import '../providers/notification_providers.dart';

class NotificationPage extends ConsumerStatefulWidget {
  static const String path = '/notifications';
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );

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
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Notifikasi',
                                maxLines: 1,
                                style: context.textStyles.header,
                              ),
                              Text(
                                'Semua notifikasi anda',
                                maxLines: 1,
                                style: context.textStyles.body,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            CustomAlert.show(
                              context,
                              title: 'Konfirmasi',
                              description:
                                  'Tandai semua notifikasi sebagai dibaca?',
                              onYes: () {
                                LoadingOverlay.show(context);
                                ref
                                    .read(markAllAsReadUsecaseProvider)
                                    .call()
                                    .then((result) {
                                      LoadingOverlay.hide();
                                      if (result.isSuccess) {
                                        ref
                                            .read(
                                              getNotificationsProvider.notifier,
                                            )
                                            .fetchNotifications(
                                              search: _searchController.text,
                                            );
                                        ref.invalidate(
                                          getUnreadCountUsecaseProvider,
                                        );
                                      } else {
                                        CustomSnackbar.error(
                                          message: result.errorMessage,
                                        );
                                      }
                                    });
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.md,
                              vertical: context.spacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: context.colors.secondary,
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                            child: Text(
                              'Tandai Dibaca',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: context.spacing.lg),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                        boxShadow: [context.shadow.small],
                      ),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          _debouncer.run(() {
                            ref
                                .read(getNotificationsProvider.notifier)
                                .fetchNotifications(search: value);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Cari notifikasi...",
                          hintStyle: context.textStyles.subtitle,
                          fillColor: Colors.white,
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
                  ],
                ),
              ),

              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(getNotificationsProvider);
                  final notifier = ref.read(getNotificationsProvider.notifier);
                  return Column(
                    children: [
                      if (state.notifications.isNotEmpty)
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(context.spacing.lg),
                          shrinkWrap: true,
                          itemCount: state.notifications.length,
                          itemBuilder: (context, index) {
                            final notification = state.notifications[index];

                            return Container(
                              padding: EdgeInsets.all(context.spacing.md),
                              margin: EdgeInsets.only(
                                bottom: context.spacing.md,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // boxShadow: [context.shadow.medium],
                                border: Border.all(
                                  color: context.colors.divider,
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
                                      Icon(
                                        Icons.notifications_outlined,
                                        color: context.colors.secondary,
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
                                              notification.title ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context.textStyles.body
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        context.colors.primary,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: context.spacing.xs,
                                            ),
                                            Text(
                                              notification.description ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context.textStyles.body,
                                            ),
                                            SizedBox(
                                              height: context.spacing.md,
                                            ),
                                            Text(
                                              notification
                                                      .createdAt
                                                      ?.toIdDateTime ??
                                                  '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context.textStyles.body,
                                            ),
                                          ],
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            vertical: context.spacing.sm,
                                          ),
                                          minimumSize: Size(0, 0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.spacing.lg,
                                          ),

                                          child: Text('Detail'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                      if (state.notifications.isEmpty && !state.isLoading)
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: context.spacing.lg),
                          child: Text(
                            'Notifikasi tidak ditemukan',
                            style: context.textStyles.body,
                          ),
                        ),

                      if (state.isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (state.hasMore && state.notifications.isNotEmpty)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: context.spacing.md,
                          ),
                          child: OutlinedButton(
                            onPressed: () => notifier.loadMore(),
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
}
