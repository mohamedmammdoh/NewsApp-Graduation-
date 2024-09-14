import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/listviewatricles.dart';
import 'package:news/Models/articlemodel.dart';
import 'package:news/services/NewsService.dart';

class ListviewBuilder extends StatefulWidget {
  const ListviewBuilder({super.key, required this.category});
  final String category;

  @override
  State<ListviewBuilder> createState() => _ListviewBuilderState();
}

class _ListviewBuilderState extends State<ListviewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    future = NewsServices().GetNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListViewArticles(
            article: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const ErorrMassage();
        } else {
          return const Indecator();
        }
      },
    );
  }
}

class Indecator extends StatelessWidget {
  const Indecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErorrMassage extends StatelessWidget {
  const ErorrMassage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'OOPS There was an error ,trylater',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
