import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/Listviewbuilder.dart';
import 'package:news/CustomWidgets/appbartitle.dart';
import 'package:news/CustomWidgets/listviewCategory.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});
  static const routename = 'homeview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        leading: const Icon(Icons.next_week_sharp),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
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
        child: Column(
          children: [
            ListViewCategories(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListviewBuilder(
                category: 'world',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
