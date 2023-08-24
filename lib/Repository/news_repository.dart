import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/top_news_headlines.dart';

class TopNewsHeadlinesClass {
  Future<TopNewsHeadlines> getTopNewsHeadlines() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=27e12b7fe3b44cfdbcf5fb46dbdd7ad8'));

    if (response.statusCode == 200) {

      Map<String, dynamic> data = jsonDecode(response.body.toString());
      print(data);
      return TopNewsHeadlines.fromJson(data);
    } else {
      throw Exception('Error ');
    }
  }
}
