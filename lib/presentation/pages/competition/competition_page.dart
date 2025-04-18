import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';
import 'package:winngoo_reels_app/main.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/tabs/about_tab.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/tabs/demo_videos.dart';
import 'package:winngoo_reels_app/presentation/widgets/CarouselSlider.dart';

class CompetitionPage extends StatelessWidget {
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
          // backgroundColor: Colors.transparent,
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
            const SizedBox(height: 8),

            Row(),

            // Rounded TabBar container
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
                  color: Color(0xFF193A84), // Blue selected tab background
                  borderRadius: BorderRadius.circular(24),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: "About"),
                  Tab(text: "Demo videos"),
                  Tab(text: "Rules & Guidelines"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Tabs content
            Expanded(
              child: TabBarView(
                children: [
                  AboutTab(),
                  DemoVideosTab(),
                  // RulesGuidelinesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
