import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winngoo_reels_app/core/constants/app_colors.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({super.key});

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  bool _videoUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Upload Video",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(1000, 80, 10, 100),
                items: [
                  PopupMenuItem(
                    child: Text(
                      "Competition Rules",
                      style: GoogleFonts.inter(),
                    ),
                  ),
                  PopupMenuItem(
                    child: Text("Review", style: GoogleFonts.inter()),
                  ),
                  PopupMenuItem(
                    child: Text("Logout", style: GoogleFonts.inter()),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: _videoUploaded ? _buildUploadedUI() : _buildUploadFormUI(),
      ),
    );
  }

  Widget _buildUploadFormUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload Video box
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                "Upload Video",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Appcolors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/upload_placeholder.png",
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Drop your video here",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Supported: .MP4, .MOV",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('Type', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter type",
            hintStyle: GoogleFonts.inter(),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Appcolors.black, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Description',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Type here",
            hintStyle: GoogleFonts.inter(),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Appcolors.black, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _videoUploaded = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Upload",
              style: GoogleFonts.inter(
                color: Appcolors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadedUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Uploaded video box
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload Video",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/video_thumbnail.png",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Already you sent reels video",
                  style: GoogleFonts.inter(fontSize: 14),
                ),
              ],
            ),
          ),

          // Review Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leave Your Review",
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star_border,
                      color: Colors.grey,
                      size: 30,
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Text(
                  "Leave Your Comment",
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:winngoo_reels_app/core/constants/app_colors.dart';

// class UploadVideoPage extends StatelessWidget {
//   const UploadVideoPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Upload Video",
//           style: GoogleFonts.inter(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.black),
//             onPressed: () {
//               // Show popup
//               showMenu(
//                 context: context,
//                 position: RelativeRect.fromLTRB(1000, 80, 10, 100),
//                 items: [
//                   PopupMenuItem(
//                     child: Text(
//                       "Competition Rules",
//                       style: GoogleFonts.inter(),
//                     ),
//                   ),
//                   PopupMenuItem(
//                     child: Text("Review", style: GoogleFonts.inter()),
//                   ),
//                   PopupMenuItem(
//                     child: Text("Logout", style: GoogleFonts.inter()),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Upload video box
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     "Upload Video",
//                     style: GoogleFonts.inter(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     height: 150,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Appcolors.primaryColor,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/images/upload_placeholder.png",
//                             height: 60,
//                           ), // Replace with your asset
//                           const SizedBox(height: 10),
//                           Text(
//                             "Drop your video here",
//                             style: GoogleFonts.inter(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             "Supported: .MP4, .MOV",
//                             style: GoogleFonts.inter(
//                               fontSize: 12,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text('Type', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 20),

//             // Type input
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Enter type",
//                 hintStyle: GoogleFonts.inter(),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(color: Appcolors.black, width: 2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),

//             Text(
//               'Description',
//               style: GoogleFonts.inter(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),

//             // Description input
//             TextField(
//               maxLines: 3,
//               decoration: InputDecoration(
//                 hintText: "Type here",
//                 hintStyle: GoogleFonts.inter(),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(color: Appcolors.black, width: 2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Upload button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Appcolors.primaryColor,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 40,
//                     vertical: 14,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   "Upload",
//                   style: GoogleFonts.inter(
//                     color: Appcolors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
