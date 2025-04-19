import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';

class ReferralHistoryPage extends StatelessWidget {
  const ReferralHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              'Referral History',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildTable(),
            const SizedBox(height: 20),
            _buildReferralCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        columnWidths: const {
          0: FixedColumnWidth(40),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FixedColumnWidth(60),
          4: FixedColumnWidth(80),
        },
        children: [
          _buildTableRow([
            'S.NO',
            'NAME',
            'TYPE',
            'AMOUNT',
            'STATUS',
          ], isHeader: true),
          _buildTableRow([
            '1',
            'Giri',
            'Member to Member',
            '£2.00',
            'Pending',
          ], statusColor: Colors.red),
          _buildTableRow([
            '2',
            'Satheesh',
            'Member to Member',
            '£2.00',
            'Approved',
          ], statusColor: Colors.green),
        ],
      ),
    );
  }

  TableRow _buildTableRow(
    List<String> cells, {
    bool isHeader = false,
    Color? statusColor,
  }) {
    return TableRow(
      children:
          cells.map((text) {
            final isStatusCell = cells.indexOf(text) == 4;
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                  color: isStatusCell && !isHeader ? statusColor : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
    );
  }

  Widget _buildReferralCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Appcolors.primaryBlue, // Use your blue color here
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Refer a friend and earn £ 2.00',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Referral ID : Winngooreels-799739',
              style: GoogleFonts.inter(color: Colors.white),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.white, size: 18),
                label: Text(
                  'Invite',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.secondaryYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildBottomNavBar() {
  //   return BottomNavigationBar(
  //     backgroundColor: Appcolors.primaryBlue,
  //     selectedItemColor: Colors.white,
  //     unselectedItemColor: Colors.white.withOpacity(0.6),
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.upload), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
  //     ],
  //   );
  // }
}
