import 'package:flutter/material.dart';

import '../../features/home/presentations/pages/home_page.dart';
import '../../features/invitations/presentations/pages/invitation_page.dart';
import '../../shared/widgets/bottom_navbar.dart';

class UserLayout extends StatefulWidget {
  static const String path = '/user-layout';
  const UserLayout({super.key});

  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    InvitationPage(),
    SizedBox(),
    SizedBox(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
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
            counterBadge: '11',
          ),
          BottomNavBarItem(
            icon: Icons.person_outlined,
            activeIcon: Icons.person,
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
