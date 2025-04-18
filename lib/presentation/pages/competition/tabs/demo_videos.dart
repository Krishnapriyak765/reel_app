// import 'package:flutter/material.dart';
// import 'package:winngoo_reels_app/presentation/widgets/tab_floating_buttons.dart';

// class DemoVideosTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // TabHeaderBanner(
//           //   imagePath: 'assets/banner2.jpg',
//           //   startDate: '2025-04-24',
//           //   endDate: '2025-04-30',
//           // ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "How to make it real videos",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 200,
//                   color: Colors.grey.shade300,
//                   child: Center(child: Icon(Icons.play_circle_fill, size: 60)),
//                 ),
//               ],
//             ),
//           ),
//           TabFloatingButtons(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DemoVideosTab extends StatefulWidget {
  const DemoVideosTab({super.key});

  @override
  State<DemoVideosTab> createState() => _DemoVideosTabState();
}

class _DemoVideosTabState extends State<DemoVideosTab> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.example.com/sample_video.mp4',
      )
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          _controller.value.isInitialized
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to make it real videos'",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              size: 60,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
