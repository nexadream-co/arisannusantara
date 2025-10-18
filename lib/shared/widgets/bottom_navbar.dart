import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class BottomNavBarItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final String? counterBadge;
  const BottomNavBarItem({
    required this.icon,
    this.activeIcon,
    this.counterBadge,
    required this.label,
  });
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;
  final List<BottomNavBarItem> items;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final btm = theme.bottomNavigationBarTheme;
    final tt = context.textStyles.bodySmall;

    final background = btm.backgroundColor ?? Colors.white;
    final selectedColor = btm.selectedItemColor ?? cs.secondary;
    final unselectedColor =
        btm.unselectedItemColor ?? cs.onSurface.withValues(alpha: 0.6);
    final showSelected = btm.showSelectedLabels ?? true;
    final showUnselected = btm.showUnselectedLabels ?? true;

    const double barHeight = 70;
    const double indicatorHeight = 5;
    const double indicatorWidth = 60;

    return Material(
      elevation: 0,
      color: background,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: barHeight,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / items.length;
              final left =
                  (itemWidth * selectedIndex) +
                  (itemWidth - indicatorWidth) / 2;

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    left: left,
                    width: indicatorWidth,
                    height: indicatorHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: cs.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(items.length, (i) {
                      final selected = i == selectedIndex;
                      final color = selected ? selectedColor : unselectedColor;
                      final iconData = selected
                          ? items[i].activeIcon ?? items[i].icon
                          : items[i].icon;

                      return Expanded(
                        child: InkWell(
                          onTap: () => onTap(i),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 12),
                              Badge(
                                label: Text(
                                  items[i].counterBadge?.toString() ?? '',
                                ),
                                isLabelVisible: items[i].counterBadge != null,
                                child: Icon(iconData, size: 28, color: color),
                              ),
                              const SizedBox(height: 4),
                              if ((selected && showSelected) ||
                                  (!selected && showUnselected))
                                Text(
                                  items[i].label,
                                  style: (selected
                                      ? tt.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: color,
                                        )
                                      : tt.copyWith(color: color)),
                                ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
