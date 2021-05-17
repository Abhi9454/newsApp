import 'package:flutter/cupertino.dart';
import 'package:newsapp/models/news_home_model.dart';
import 'package:newsapp/services/news_home_service.dart';
import 'package:newsapp/viewmodels/news_home_view_model.dart';

class NewsArticleListViewModel extends ChangeNotifier{
  List<NewsArticleViewModel> articles;

  void sportsHeadLines() async {
     List<NewsArticle> _list = await WebService().fetchArticle();
     this.articles = _list.map((article) => NewsArticleViewModel(article : article)).toList();

     notifyListeners();
  }
}