import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/presentations/pages/home_page.dart';
import '../../features/invitations/presentations/pages/invitation_page.dart';
import '../../features/notifications/presentations/pages/notification_page.dart';
import '../../features/notifications/presentations/providers/get_unread_count_provider.dart';
import '../../features/profile/presentations/pages/profile_page.dart';
import '../../shared/widgets/bottom_navbar.dart';

class UserLayout extends StatefulWidget {
  static const String path = '/user-layout';
  final int selectedIndex;
  const UserLayout({super.key, this.selectedIndex = 0});

  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    InvitationPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final unreadCountAsync = ref.watch(getUnreadCountProvider);
          String? counterNotificationBadge;
          unreadCountAsync.when(
            data: (data) {
              if (data > 0) {
                counterNotificationBadge = data.toString();
              }
            },
            error: (_, __) => null,
            loading: () => null,
          );

          return BottomNavBar(
            selectedIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavBarItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: "Beranda",
              ),
              BottomNavBarItem(
                icon: Icons.chat_outlined,
                activeIcon: Icons.chat,
                label: "Undangan",
              ),
              BottomNavBarItem(
                icon: Icons.notifications_outlined,
                activeIcon: Icons.notifications,
                label: "Notifikasi",
                counterBadge: counterNotificationBadge,
              ),
              BottomNavBarItem(
                icon: Icons.person_outlined,
                activeIcon: Icons.person,
                label: "Profil",
              ),
            ],
          );
        },
      ),
    );
  }
}
