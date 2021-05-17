import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/config.dart';
import 'package:newsapp/viewmodels/news_home_list_view_model.dart';
import 'package:newsapp/views/AricleDetailPage/ArticleDetailPageUI.dart';
import 'package:newsapp/views/HomePage/HomePageUI.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppConfig().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsArticleListViewModel()),
        ],
        child: NavigationTab(),
      ),
    );
  }
}

class NavigationTab extends StatefulWidget {
  const NavigationTab({Key key}) : super(key: key);

  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news), label: "Feeds"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.list_dash), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Settings")
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return MyHomePage();
              break;
            case 1:
              return MyHomePage();
              break;
            case 2:
              return ArticleDetailPage();
              break;
            default:
              return MyHomePage();
              break;
          }
        });
  }
}
