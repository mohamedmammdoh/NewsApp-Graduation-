import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/CustomWidgets/Listviewbuilder.dart';
import 'package:news/CustomWidgets/listviewCategory.dart';
import 'package:news/ThemeApp.dart';
import 'package:news/cubit/Auth/AuthCubit.dart';
import 'SearchView.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  static const routename = 'homeview';

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Universal Update'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ThemeService().changeTheme();
            },
            icon: const Icon(CupertinoIcons.moon),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routename);
            },
          ),
          IconButton(
            onPressed: () async {
              await authCubit.LogOut(context: context);
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
