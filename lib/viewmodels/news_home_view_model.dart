import 'package:newsapp/models/news_home_model.dart';

class NewsArticleViewModel{
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get provider{
     return _newsArticle.newsProvider;
  }

   String get title{
     return _newsArticle.newsTitle;
   }

   String get description{
     return _newsArticle.newsDescription;
   }

  String get url{
    return _newsArticle.webUrl;
  }

  String get image{
    return _newsArticle.newsImage;
  }

  String get publishedAt{
    return _newsArticle.publishedTime;
  }
}