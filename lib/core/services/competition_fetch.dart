import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:winngoo_reels_app/data/models/competition_enddate.dart';

Future<Competition?> fetchCompetitionData(String token) async {
  final response = await http.get(
    Uri.parse('https://winngooreels.wimbgo.com/api/competitions'),
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return Competition.fromJson(data['data']); // Adjust if it's a list
  } else {
    print('Failed to load competition data');
    return null;
  }
}
