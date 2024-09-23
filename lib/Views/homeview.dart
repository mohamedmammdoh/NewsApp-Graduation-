import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news/CustomWidgets/Listviewbuilder.dart';
import 'package:news/CustomWidgets/appbartitle.dart';
import 'package:news/CustomWidgets/listviewCategory.dart';
import 'package:news/Views/loginview.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});
  static const routename = 'homeview';

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginView.routename);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('LogOut Successfully'),
                ),
              );
            },
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
