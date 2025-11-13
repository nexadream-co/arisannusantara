import 'package:flutter/material.dart';

import '../../features/feedback/presentations/pages/feedback_page.dart';
import '../../features/groups/presentations/pages/group_and_user_page.dart';
import '../../features/home/presentations/pages/superadmin_home_page.dart';
import '../../features/profile/presentations/pages/profile_page.dart';
import '../../shared/widgets/bottom_navbar.dart';
import '../services/firebase_messaging_service.dart';

class SuperadminLayout extends StatefulWidget {
  static const String path = '/superadmin-layout';
  const SuperadminLayout({super.key});

  @override
  State<SuperadminLayout> createState() => _SuperadminLayoutState();
}

class _SuperadminLayoutState extends State<SuperadminLayout> {
  int _selectedIndex = 0;
  int _selectedGroupUserPage = 0;

  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedGroupUserPage = 0;
      updatePage();
    });
  }

  @override
  void initState() {
    super.initState();
    updatePage();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseMessagingService().init(context);
    });
  }

  void updatePage() {
    _pages = [
      SuperadminHomePage(
        onChangePage: (index, groupUserIndex) {
          setState(() {
            _selectedIndex = index;
            _selectedGroupUserPage = groupUserIndex;
            updatePage();
          });
        },
      ),
      GroupAndUserPage(selectedIndex: _selectedGroupUserPage),
      FeedbackPage(),
      ProfilePage(),
    ];
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
            icon: Icons.people_outline,
            activeIcon: Icons.people,
            label: "Grup & Pengguna",
          ),
          BottomNavBarItem(
            icon: Icons.chat_outlined,
            activeIcon: Icons.chat,
            label: "Feedback",
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
