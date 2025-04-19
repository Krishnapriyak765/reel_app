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
    MembershipInfoPage(), // Profile
    UploadVideoPage(), // Upload
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
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                color: Appcolors.primaryBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
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
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:winngoo_reels_app/core/constants/app_colors.dart';
// import 'package:winngoo_reels_app/presentation/pages/dashboard/home/profile_screen.dart';
// import 'package:winngoo_reels_app/presentation/pages/dashboard/home/refferal_screen.dart';
// import 'package:winngoo_reels_app/presentation/pages/dashboard/home/upload_video_page.dart';

// class HomeScreenWithNav extends StatefulWidget {
//   const HomeScreenWithNav({Key? key}) : super(key: key);

//   @override
//   State<HomeScreenWithNav> createState() => _HomeScreenWithNavState();
// }

// class _HomeScreenWithNavState extends State<HomeScreenWithNav> {
//   int currentIndex = 1;

//   final List<Widget> _screens = [
//     MembershipInfoPage(), // Profile pageReferralHistoryPage()
//     UploadVideoPage(), //Home
//     ReferralHistoryPage(), // Home page or Discover page // Home page or Discover page
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         backgroundColor: Appcolors.primaryBlue,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(0.6),
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.file_upload_rounded, size: 30),
//             label: "Upload",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }
