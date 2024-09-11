import 'package:flutter/cupertino.dart';
import 'package:news/Widgets/ArticleWidget.dart';

class ListViewArticles extends StatelessWidget {
  const ListViewArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => const ArticleWidget(),
      ),
    );
  }
}
