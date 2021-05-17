import 'package:flutter/material.dart';
import 'package:newsapp/config.dart';
import 'package:newsapp/viewmodels/news_home_list_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageBody extends StatefulWidget {
  final NewsArticleListViewModel body;

  HomePageBody({Key key, @required this.body}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {


  void _launchURL(_url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';






  Widget newsListLayout(
      String newsSource,
      String newsTitle,
      String newsDescription,
      String webUrl,
      String newsImage,
      String publishedTime) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _launchURL(webUrl);
            },
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        newsTitle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    newsImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              newsImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.width * 0.5,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace stackTrace) {
                                return Container();
                              },
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 6,
                    ),
                    newsDescription != null
                        ? Container(
                            child: Text(
                              newsDescription,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 5,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        newsSource != null
                            ? Text(
                                "Source : " + newsSource,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            : Text(
                                "Source : Unknown",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                        publishedTime != null
                            ? Text(
                                publishedTime,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
            child: Divider(
              color: AppConfig().secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return newsListLayout(
                    widget.body.articles[index].provider,
                    widget.body.articles[index].title,
                    widget.body.articles[index].description,
                    widget.body.articles[index].url,
                    widget.body.articles[index].image,
                    widget.body.articles[index].publishedAt);
              },
            )),
      ),
    );
  }
}
