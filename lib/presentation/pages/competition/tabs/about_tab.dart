import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/main.dart';
import 'package:winngoo_reels_app/presentation/widgets/tab_floating_buttons.dart';
import 'package:winngoo_reels_app/presentation/widgets/theme_list_title.dart';

class AboutTab extends StatelessWidget {
  final List<String> themes = [
    "A Day with Winngoo – Savings & Surprises",
    "Best Deal I Found on Winngoo",
    "Winngoo Challenge – How Much Can I Save?",
    "Winngoo vs. Full Price – Which Wins?",
    "Hidden Gems & Discounts on Winngoo",
    "How Winngoo Helps Small Businesses & Shoppers",
    "The Ultimate Winngoo Shopping or Dining Experience",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // TabHeaderBanner(
          //   imagePath: 'assets/images/Mobile_banner_about.png',
          //   startDate: '2025-04-24',
          //   endDate: '2025-04-30',
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "📢 Winngoo Reel Competition – Show Your Creativity & Win!",
                ),
                SizedBox(height: 8),
                Text("Love making reels? This is your chance! ... 🎉"),
                SizedBox(height: 12),
                Text(
                  "📌 Pick a Theme & Get Creative!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ...themes.map((theme) => ThemeListTile(title: theme)).toList(),
              ],
            ),
          ),
          Container(height: screenHeight * 0.03, child: TabFloatingButtons()),
        ],
      ),
    );
  }
}
