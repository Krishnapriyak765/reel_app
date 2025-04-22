import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';
import 'package:winngoo_reels_app/main.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/profile_screen.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/refferal_screen.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/upload_video.dart';

class HomeScreenWithNav extends StatefulWidget {
  const HomeScreenWithNav({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithNav> createState() => _HomeScreenWithNavState();
}

class _HomeScreenWithNavState extends State<HomeScreenWithNav> {
  int currentIndex = 1;

  final List<Widget> _screens = [
    MembershipInfoPage(), // Profile
    UploadVideoScreen(), // Upload
    ReferralHistoryPage(), // Referral
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.08,
              margin: const EdgeInsets.only(top: 16),
              // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                color: Appcolors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(42),
                  topRight: Radius.circular(42),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, "assets/icons/profile.png"),
                  _buildNavItem(1, "assets/icons/upload.png"),
                  _buildNavItem(2, "assets/icons/history.png"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String assetPath) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            assetPath,
            height: 28,
            color: isSelected ? Appcolors.white : Colors.white.withOpacity(0.5),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 6,
              width: 4,
              decoration: BoxDecoration(
                color: Appcolors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
