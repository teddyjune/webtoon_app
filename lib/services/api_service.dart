import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_app/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> WebtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        WebtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
    }
    return WebtoonInstances;
  }
}
