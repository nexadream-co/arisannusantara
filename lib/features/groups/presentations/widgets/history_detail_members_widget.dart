// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import '../../../../config/enums/history_member_filter_enum.dart';
import '../../../../config/enums/payment_status_enum.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../domain/entities/history_entity.dart';
import '../../domain/entities/member_entity.dart';
import 'package:collection/collection.dart';

class HistoryDetailMembersWidget extends StatefulWidget {
  final HistoryEntity history;
  const HistoryDetailMembersWidget({super.key, required this.history});

  @override
  State<HistoryDetailMembersWidget> createState() =>
      _HistoryDetailMembersWidgetState();
}

class _HistoryDetailMembersWidgetState
    extends State<HistoryDetailMembersWidget> {
  HistoryMemberFilterEnum selectedFilter = HistoryMemberFilterEnum.all;

  @override
  Widget build(BuildContext context) {
    final filters = HistoryMemberFilterEnum.values;

    return Column(
      children: [
        // Filter Tabs
        Container(
          margin: EdgeInsets.only(
            bottom: context.spacing.lg,
            top: context.spacing.lg,
          ),
          height: context.appSize.s40,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
            itemCount: filters.length,
            itemBuilder: (context, index) {
              final filter = filters[index];
              final isSelected = selectedFilter == filter;

              return GestureDetector(
                onTap: () => setState(() => selectedFilter = filter),
                child: Container(
                  margin: EdgeInsets.only(right: context.spacing.sm),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.colors.secondary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(context.radius.medium),
                    border: isSelected
                        ? null
                        : Border.all(color: context.colors.secondary),
                  ),
                  child: Text(
                    filter.label,
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
        ),

        // Member List
        if (filteredMembers.isEmpty)
          Padding(
            padding: EdgeInsets.all(context.spacing.lg),
            child: Text('Tidak ada anggota', style: context.textStyles.body),
          )
        else
          Column(
            spacing: context.spacing.md,
            children: filteredMembers.mapIndexed((i, member) {
              final user = member.user;
              final initials = user?.name?.initials ?? '';

              return Container(
                padding: EdgeInsets.only(
                  bottom: context.spacing.md,
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                ),
                decoration: BoxDecoration(
                  border: i == filteredMembers.length - 1
                      ? null
                      : Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: context.colors.surface,
                      child: Text(
                        initials,
                        style: context.textStyles.body.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: context.spacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user?.name ?? '-',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.spacing.xs),
                          Text(
                            user?.email ?? '-',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.bodySmall,
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
                          horizontal: context.spacing.md,
                        ),
                        child: Text(member.paymentStatus?.label ?? '-'),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  List<MemberEntity> get filteredMembers {
    final members = widget.history.members ?? [];

    switch (selectedFilter) {
      case HistoryMemberFilterEnum.winners:
        return widget.history.winners ?? [];
      case HistoryMemberFilterEnum.skipped:
        return members
            .where((m) => m.paymentStatus == PaymentStatusEnum.skip)
            .toList();
      case HistoryMemberFilterEnum.active:
        return members.where((m) => m.isActive == true).toList();
      case HistoryMemberFilterEnum.inactive:
        return members.where((m) => m.isActive == false).toList();
      case HistoryMemberFilterEnum.all:
        return members;
    }
  }
}
