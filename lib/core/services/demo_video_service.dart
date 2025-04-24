import 'package:http/http.dart' as http;
import 'package:winngoo_reels_app/data/models/user_demo_video.dart';
import 'dart:convert';

Future<List<DemoVideo>> fetchDemoVideos() async {
  const url = 'https://winngooreels.wimbgo.com/api/user/videos';
  const token = '22|zLW73KFG8P6QptUdgZZ56xRBLxxZYDhMagPx7rVDb2328240';

  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData is List) {
      return jsonData.map((video) => DemoVideo.fromJson(video)).toList();
    } else {
      throw Exception('Invalid data format');
    }
  } else {
    throw Exception('Failed to load videos');
  }
}
