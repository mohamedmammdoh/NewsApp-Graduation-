import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/Listviewbuilder.dart';
import 'package:news/CustomWidgets/listviewCategory.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});
  static String routename = 'newsview';
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 5.0, left: 5.0),
      child: Column(
        children: [
          // ListViewCategories(),
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
    );
  }
}
