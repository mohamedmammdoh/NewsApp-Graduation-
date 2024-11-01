import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:news/Models/categorymodel.dart';
import 'package:news/CustomWidgets/categorywidget.dart';

import '../CustomWidgets/listviewCategory.dart';

import 'package:flutter/material.dart';
import 'package:news/Models/categorymodel.dart';
import 'package:news/CustomWidgets/categorywidget.dart';
import 'package:news/Views/NewsListScreen.dart'; // Import your new screen

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categorylist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsListScreen(category: categorylist[index].categoryname),
                  ),
                );
              },
              child: CategoryWidget(
                category: categorylist[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
