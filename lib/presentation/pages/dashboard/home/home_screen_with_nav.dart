import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/profile_screen.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/refferal_screen.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/upload_video_page.dart';

class HomeScreenWithNav extends StatefulWidget {
  const HomeScreenWithNav({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithNav> createState() => _HomeScreenWithNavState();
}

class _HomeScreenWithNavState extends State<HomeScreenWithNav> {
  int currentIndex = 1;

  final List<Widget> _screens = [
    ReferralHistoryPage(), // Home page or Discover page
    UploadVideoPage(), //Home
    MembershipInfoPage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Appcolors.primaryBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload_rounded, size: 30),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
