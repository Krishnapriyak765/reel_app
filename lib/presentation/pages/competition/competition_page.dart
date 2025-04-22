import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';
import 'package:winngoo_reels_app/core/services/competition_fetch.dart';
import 'package:winngoo_reels_app/data/models/competition_enddate.dart';
import 'package:winngoo_reels_app/main.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/tabs/about_tab.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/tabs/demo_videos.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/tabs/rules_guidelines_tab.dart';
import 'package:winngoo_reels_app/presentation/widgets/CarouselSlider.dart';

class CompetitionPage extends StatefulWidget {
  @override
  State<CompetitionPage> createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  Competition? competition;

  @override
  void initState() {
    super.initState();
    loadCompetition();
  }

  Future<void> loadCompetition() async {
    const token =
        '4|CAQ9z1WD9vyFSp1Nt9VeN3FfQIoIRODAWz3InEUO178ecac2'; // Or from storage
    final result = await fetchCompetitionData(token);
    setState(() {
      competition = result;
    });
  }

  String getFormattedTime(int totalSeconds) {
    final minutes = (totalSeconds / 60).floor();
    return "$totalSeconds sec / $minutes mins";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "Competition",
            style: GoogleFonts.inter(color: Appcolors.white),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF090019),
                  Color(0xFF3B225C),
                  Color(0xFF0F4A86),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(height: screenHeight * 0.23, child: CarouselSliders()),

            /// 👉 This is the row you asked for
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    competition != null
                        ? "Time: ${getFormattedTime(competition!.totalSeconds)}"
                        : "Time: ...",
                    style: GoogleFonts.inter(color: Colors.red, fontSize: 13),
                  ),
                  Text(
                    competition != null
                        ? "End Date: ${competition!.endDate}"
                        : "End Date: ...",
                    style: GoogleFonts.inter(color: Colors.red, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,

                borderRadius: BorderRadius.circular(32),
              ),
              child: TabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                indicator: BoxDecoration(
                  color: Appcolors.primaryColor,
                  borderRadius: BorderRadius.circular(34),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: "   About   "),
                  Tab(text: "Demo videos"),
                  Tab(text: "Rules & Guidelines"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: TabBarView(
                children: [
                  AboutTab(),
                  DemoVideosTab(),
                  RulesAndGuidelinesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:winngoo_reels_app/core/constants/app_colors.dart';
// import 'package:winngoo_reels_app/main.dart';
// import 'package:winngoo_reels_app/presentation/pages/competition/tabs/about_tab.dart';
// import 'package:winngoo_reels_app/presentation/pages/competition/tabs/demo_videos.dart';
// import 'package:winngoo_reels_app/presentation/pages/competition/tabs/rules_guidelines_tab.dart';
// import 'package:winngoo_reels_app/presentation/widgets/CarouselSlider.dart';

// class CompetitionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           automaticallyImplyLeading: true,
//           title: Text(
//             "Competition",
//             style: GoogleFonts.inter(color: Appcolors.white),
//           ),
//           // backgroundColor: Colors.transparent,
//           elevation: 0,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF090019),
//                   Color(0xFF3B225C),
//                   Color(0xFF0F4A86),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(height: screenHeight * 0.23, child: CarouselSliders()),
//             const SizedBox(height: 8),

//             Row(),

//             // Rounded TabBar container
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(32),
//               ),
//               child: TabBar(
//                 labelPadding: const EdgeInsets.symmetric(horizontal: 8),
//                 indicator: BoxDecoration(
//                   color: Appcolors.primaryColor, // Blue selected tab background
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.black,
//                 labelStyle: TextStyle(
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w600,
//                 ),
//                 tabs: const [
//                   Tab(text: "About"),
//                   Tab(text: "Demo videos"),
//                   Tab(text: "Rules & Guidelines"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 10),

//             // Tabs content
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   AboutTab(),
//                   DemoVideosTab(),
//                   RulesAndGuidelinesTab(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
