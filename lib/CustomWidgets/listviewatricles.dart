import 'package:flutter/cupertino.dart';
import 'package:news/CustomWidgets/ArticleWidget.dart';
import 'package:news/Models/articlemodel.dart';

class ListViewArticles extends StatelessWidget {
  const ListViewArticles({super.key, required this.article});
  final List<ArticleModel> article;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: article.length,
      itemBuilder: (context, index) => ArticleWidget(
        articleModel: article[index],
      ),
    );
  }
}
