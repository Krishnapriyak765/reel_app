import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/core/services/demo_video_service.dart';
import 'package:winngoo_reels_app/data/models/user_demo_video.dart';
import 'package:winngoo_reels_app/presentation/widgets/video_player_screen.dart';

class DemoVideosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DemoVideo>>(
      future: fetchDemoVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('⚠️ Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No demo videos found.'));
        }

        final videos = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(video.title),
                subtitle: Text(video.videoUrl),
                trailing: Icon(Icons.play_circle_fill, color: Colors.blue),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => VideoPlayerScreen(videoUrl: video.videoUrl),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
