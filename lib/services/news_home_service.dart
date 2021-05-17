import 'package:dio/dio.dart';
import 'package:newsapp/models/news_home_model.dart';


class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchArticle() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=aa67d8d98c8e4ad1b4f16dbd5f3be348";

    final response = await dio.get(url);

    if(response.statusCode == 200){
       final result = response.data;
       Iterable list = result['articles'];
       return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Unable to Connect');
    }
  }
}