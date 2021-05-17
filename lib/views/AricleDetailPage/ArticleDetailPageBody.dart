import 'package:flutter/material.dart';

class ArticleDetailPageBody extends StatefulWidget {
  const ArticleDetailPageBody({Key key}) : super(key: key);

  @override
  _ArticleDetailPageBodyState createState() => _ArticleDetailPageBodyState();
}

class _ArticleDetailPageBodyState extends State<ArticleDetailPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recently India won a championship by 3-1 in Bangladesh. Know some interesting facts about this..',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 6,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2019/11/india-vs-bangladesh-1st-t20i-1572754763.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.6,
                errorBuilder: (BuildContext context,
                    Object exception, StackTrace stackTrace) {
                  return Container();
                },
              ),
            ),
            SizedBox(height: 6,),
            Text(
              'Source : Google News',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(height: 6,),
            Text(
              'Updated at : 2 October 2020',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
            SizedBox(height: 6,),
            Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
