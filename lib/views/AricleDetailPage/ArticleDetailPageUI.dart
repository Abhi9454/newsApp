import 'package:flutter/material.dart';
import 'package:newsapp/config.dart';
import 'package:newsapp/views/AricleDetailPage/ArticleDetailPageBody.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({Key key}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios),
          color: AppConfig().iconColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppConfig().iconColor,
            ),
          ),
        ],
      ),
      body: ArticleDetailPageBody(),
    );
  }
}
