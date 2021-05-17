import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/config.dart';
import 'package:newsapp/viewmodels/news_home_list_view_model.dart';
import 'package:newsapp/views/HomePage/HomePageBody.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .sportsHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig().homePageTitle),
        leading: Icon(
          Icons.menu,
          color: AppConfig().iconColor,
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
      body: listViewModel.articles == null
          ? SpinKitSquareCircle(
              color: AppConfig().primaryColor,
              size: 100.0,
            )
          : HomePageBody(body: listViewModel),
    );
  }
}
