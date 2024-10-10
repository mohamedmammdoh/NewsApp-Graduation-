import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/newsviewbody.dart';
import 'package:news/Models/articlemodel.dart';

class NewTitleView extends StatefulWidget {
  const NewTitleView({super.key, required this.articleModel});
  static String routename = 'titleview';
  final ArticleModel articleModel;

  @override
  State<NewTitleView> createState() => _NewTitleViewState();
}

class _NewTitleViewState extends State<NewTitleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(
          'Title Details',
        ),
        centerTitle: true,
      ),
      body: NewsTitleBody(articleModel: widget.articleModel),
    );
  }
}
