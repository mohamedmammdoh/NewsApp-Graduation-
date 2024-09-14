import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/Listviewbuilder.dart';
import 'package:news/CustomWidgets/appbartitle.dart';
import 'package:news/CustomWidgets/listviewCategory.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});
  static const routename = 'homeview';

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool isdark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: isdark
                  ? Icon(Icons.dark_mode)
                  : Icon(
                      Icons.light_mode,
                    )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              // color: Colors.black,
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
