import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';
import 'package:winngoo_reels_app/core/services/referral_api_service.dart';
import 'package:winngoo_reels_app/data/models/referral_model.dart';
import 'package:winngoo_reels_app/main.dart';

class ReferralHistoryPage extends StatefulWidget {
  const ReferralHistoryPage({super.key});

  @override
  State<ReferralHistoryPage> createState() => _ReferralHistoryPageState();
}

class _ReferralHistoryPageState extends State<ReferralHistoryPage> {
  ReferralData? referralData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchReferralInfo();
  }

  Future<void> fetchReferralInfo() async {
    final data = await ApiService.getReferralData();
    setState(() {
      referralData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolors.white,
        body:
            isLoading
                ? const Center(child: Text('NO Referral Found!'))
                : Column(
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Referral History',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTable(referralData!.referrals),
                    const SizedBox(height: 20),
                    _buildReferralCard(referralData!.referralCode),
                  ],
                ),
      ),
    );
  }

  Widget _buildTable(List<ReferralItem> items) {
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
          ...items.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            final color =
                item.status.toLowerCase() == 'approved'
                    ? Colors.green
                    : Colors.red;
            return _buildTableRow([
              (i + 1).toString(),
              item.name,
              item.type,
              item.amount,
              item.status,
            ], statusColor: color);
          }),
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
          cells.asMap().entries.map((entry) {
            final index = entry.key;
            final text = entry.value;
            final isStatusCell = index == 4;
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                  color:
                      isStatusCell && !isHeader ? statusColor : Appcolors.black,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }).toList(),
    );
  }

  Widget _buildReferralCard(String referralCode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Appcolors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refer a friend and earn £2.00',
                    style: GoogleFonts.inter(
                      color: Appcolors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Referral ID:\n$referralCode',
                    style: GoogleFonts.inter(color: Appcolors.white),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Share code
                    },
                    icon: Icon(Icons.share, color: Appcolors.white, size: 18),
                    label: Text(
                      'Invite',
                      style: GoogleFonts.inter(
                        color: Appcolors.white,
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
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.3,
              height: screenHeight * 0.1,
              child: Image.asset('assets/images/refferal.png'),
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

// class ReferralHistoryPage extends StatelessWidget {
//   const ReferralHistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Appcolors.white,

//         // appBar: AppbarT(title: ' ', ontap: () {}),
//         body: Column(
//           children: [
//             const SizedBox(height: 16),
//             Text(
//               'Referral History',
//               style: GoogleFonts.inter(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildTable(),
//             const SizedBox(height: 20),
//             _buildReferralCard(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTable() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       child: Table(
//         border: TableBorder.all(color: Colors.black),
//         columnWidths: const {
//           0: FixedColumnWidth(40),
//           1: FlexColumnWidth(),
//           2: FlexColumnWidth(),
//           3: FixedColumnWidth(60),
//           4: FixedColumnWidth(80),
//         },
//         children: [
//           _buildTableRow([
//             'S.NO',
//             'NAME',
//             'TYPE',
//             'AMOUNT',
//             'STATUS',
//           ], isHeader: true),
//           _buildTableRow([
//             '1',
//             'Giri',
//             'Member to Member',
//             '£2.00',
//             'Pending',
//           ], statusColor: Colors.red),
//           _buildTableRow([
//             '2',
//             'Satheesh',
//             'Member to Member',
//             '£2.00',
//             'Approved',
//           ], statusColor: Colors.green),
//         ],
//       ),
//     );
//   }

//   TableRow _buildTableRow(
//     List<String> cells, {
//     bool isHeader = false,
//     Color? statusColor,
//   }) {
//     return TableRow(
//       children:
//           cells.map((text) {
//             final isStatusCell = cells.indexOf(text) == 4;
//             return Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 text,
//                 style: GoogleFonts.inter(
//                   fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//                   fontSize: 12,
//                   color:
//                       isStatusCell && !isHeader ? statusColor : Appcolors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             );
//           }).toList(),
//     );
//   }

//   Widget _buildReferralCard(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Appcolors.primaryColor, // Use your blue color here
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Refer a friend and earn £ 2.00',
//                   style: GoogleFonts.inter(
//                     color: Appcolors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Referral ID :\n Winngooreels-799739',
//                   style: GoogleFonts.inter(color: Appcolors.white),
//                 ),
//                 const SizedBox(height: 12),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: Icon(Icons.share, color: Appcolors.white, size: 18),
//                     label: Text(
//                       'Invite',
//                       style: GoogleFonts.inter(
//                         color: Appcolors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Appcolors.secondaryYellow,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 10,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Image.asset('assets/images/refferal.png'),
//             Container(
//               width: screenWidth * 0.3,
//               height: screenHeight * 0.1,
//               child: Image.asset('assets/images/refferal.png'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _buildBottomNavBar() {
//   //   return BottomNavigationBar(
//   //     backgroundColor: Appcolors.primaryBlue,
//   //     selectedItemColor: Colors.white,
//   //     unselectedItemColor: Colors.white.withOpacity(0.6),
//   //     items: const [
//   //       BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//   //       BottomNavigationBarItem(icon: Icon(Icons.upload), label: ''),
//   //       BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
//   //     ],
//   //   );
//   // }
// }
