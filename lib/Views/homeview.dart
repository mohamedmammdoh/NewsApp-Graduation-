import 'package:flutter/material.dart';
import 'package:news/Widgets/appbartitle.dart';
import 'package:news/Widgets/listviewCategory.dart';
import 'package:news/Widgets/listviewatricles.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});
  static const routename = 'homeview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(right: 5.0, left: 5.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListViewCategories(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            ListViewArticles(),
          ],
        ),
      ),
    );
  }
}
