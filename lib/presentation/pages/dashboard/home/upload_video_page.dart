// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
// import 'package:winngoo_reels_app/core/constants/app_colors.dart';

// class UploadVideoPage extends StatefulWidget {
//   const UploadVideoPage({super.key});

//   @override
//   State<UploadVideoPage> createState() => _UploadVideoPageState();
// }

// class _UploadVideoPageState extends State<UploadVideoPage> {
//   bool _videoUploaded = false;

//   File? _uploadedVideoFile;
//   VideoPlayerController? _videoController;

//   @override
//   void dispose() {
//     _videoController?.dispose();
//     super.dispose();
//   }

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
//         backgroundColor: Appcolors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.black),
//             onPressed: () {
//               showMenu(
//                 color: Appcolors.primaryColor,
//                 context: context,
//                 position: RelativeRect.fromLTRB(1000, 80, 10, 100),
//                 items: [
//                   PopupMenuItem(
//                     child: InkWell(
//                       onTap: () {
//                         context.pushNamed('competionRule');
//                       },
//                       child: Text(
//                         "Competition Rules",
//                         style: GoogleFonts.inter(color: Appcolors.white),
//                       ),
//                     ),
//                   ),
//                   PopupMenuItem(
//                     child: Text(
//                       "Review",
//                       style: GoogleFonts.inter(color: Appcolors.white),
//                     ),
//                   ),
//                   PopupMenuItem(
//                     child: Text(
//                       "Logout",
//                       style: GoogleFonts.inter(color: Appcolors.white),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: _videoUploaded ? _buildUploadedUI() : _buildUploadFormUI(),
//       ),
//     );
//   }

//   Widget _buildUploadFormUI() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Upload Video box
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade100,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             children: [
//               Text(
//                 "Upload Video",
//                 textAlign: TextAlign.start,
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Appcolors.primaryColor, width: 2),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/images/upload_placeholder.png",
//                         height: 60,
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         "Drop your video here",
//                         style: GoogleFonts.inter(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         "Supported: .MP4, .MOV",
//                         style: GoogleFonts.inter(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text('Type', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 20),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Enter type",
//             hintStyle: GoogleFonts.inter(),
//             filled: true,
//             fillColor: Colors.grey.shade100,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Appcolors.black, width: 2),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Text(
//           'Description',
//           style: GoogleFonts.inter(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 20),
//         TextField(
//           maxLines: 3,
//           decoration: InputDecoration(
//             hintText: "Type here",
//             hintStyle: GoogleFonts.inter(),
//             filled: true,
//             fillColor: Colors.grey.shade100,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Appcolors.black, width: 2),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Center(
//           child: ElevatedButton(
//             onPressed: () {
//               uploadVideo();
//               setState(() {
//                 _videoUploaded = true;
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Appcolors.primaryColor,
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: Text(
//               "Upload",
//               style: GoogleFonts.inter(
//                 color: Appcolors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildUploadedUI() {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Uploaded video box
//           Container(
//             padding: const EdgeInsets.all(16),
//             margin: const EdgeInsets.only(bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Upload Video",
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child:
//                       _uploadedVideoFile != null &&
//                               _videoController != null &&
//                               _videoController!.value.isInitialized
//                           ? AspectRatio(
//                             aspectRatio: _videoController!.value.aspectRatio,
//                             child: VideoPlayer(_videoController!),
//                           )
//                           : Container(
//                             height: 180,
//                             color: Colors.black12,
//                             child: Center(
//                               child: Text("Video preview not available"),
//                             ),
//                           ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "Already you sent reels video",
//                   style: GoogleFonts.inter(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),

//           // Review Container
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.blue.shade100,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Leave Your Review",
//                   style: GoogleFonts.inter(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: List.generate(5, (index) {
//                     return Icon(
//                       Icons.star_border,
//                       color: Colors.grey,
//                       size: 30,
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   "Leave Your Comment",
//                   style: GoogleFonts.inter(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   maxLines: 3,
//                   decoration: InputDecoration(
//                     hintText: "Type here...",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 32,
//                         vertical: 14,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       "Submit",
//                       style: GoogleFonts.inter(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> uploadVideo() async {
//     final picked = await FilePicker.platform.pickFiles(type: FileType.video);

//     if (picked != null && picked.files.single.path != null) {
//       File file = File(picked.files.single.path!);
//       String fileName = file.path.split('/').last;

//       // Check video duration using video_player
//       final VideoPlayerController controller = VideoPlayerController.file(file);
//       await controller.initialize();
//       final Duration duration = controller.value.duration;

//       if (duration.inSeconds < 20 || duration.inSeconds > 60) {
//         showDialog(
//           context: context,
//           builder:
//               (context) => AlertDialog(
//                 title: Text("Invalid Video Length"),
//                 content: Text(
//                   "Please upload a video between 20 to 60 seconds.",
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text("OK"),
//                   ),
//                 ],
//               ),
//         );
//         return; // stop the upload
//       }

//       FormData formData = FormData.fromMap({
//         'video': await MultipartFile.fromFile(file.path, filename: fileName),
//       });

//       try {
//         Dio dio = Dio();
//         dio.options.headers["Authorization"] =
//             "Bearer 22|zLW73KFG8P6QptUdgZZ56xRBLxxZYDhMagPx7rVDb2328240";

//         Response response = await dio.post(
//           "https://winngooreels.wimbgo.com/api/user/upload-video",
//           data: formData,
//         );

//         if (response.statusCode == 200) {
//           setState(() {
//             _uploadedVideoFile = file;
//             _videoController = VideoPlayerController.file(file)
//               ..initialize().then((_) {
//                 setState(
//                   () {},
//                 ); // To refresh and show the video once it's ready
//                 _videoController?.setLooping(true);
//                 _videoController?.play(); // autoplay (optional)
//               });
//             _videoUploaded = true;
//           });

//           showDialog(
//             context: context,
//             builder:
//                 (context) => AlertDialog(
//                   title: Text("Success"),
//                   content: Text("Your video has been uploaded successfully."),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         setState(() {
//                           _videoUploaded = true;
//                         });
//                       },
//                       child: Text("OK"),
//                     ),
//                   ],
//                 ),
//           );
//         } else {
//           print("Upload failed: ${response.statusCode}");
//         }
//       } catch (e) {
//         print("Error uploading video: $e");
//       }
//     }
//   }
// }
