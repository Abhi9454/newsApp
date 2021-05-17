class NewsArticle {
  final String newsProvider;
  final String newsTitle;
  final String newsDescription;
  final String webUrl;
  final String newsImage;
  final String publishedTime;

  NewsArticle(
      {this.newsProvider,
      this.newsTitle,
      this.newsDescription,
      this.webUrl,
      this.newsImage,
      this.publishedTime});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> map = json['source'];
    var source = map['name'];

    return NewsArticle(
        newsProvider: source ?? null,
        newsTitle: json['title'],
        newsDescription: json['description'] ?? null,
        webUrl: json['url'] ?? null,
        newsImage: json['urlToImage'],
        publishedTime: json['publishedAt']);
  }
}
