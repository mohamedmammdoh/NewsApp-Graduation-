import 'package:flutter/material.dart';
import 'package:news/Models/categorymodel.dart';
import 'package:news/Widgets/categorywidget.dart';

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          return CategoryWidget(
            category: categorylist[index],
          );
        },
      ),
    );
  }
}

List<CategoryModel> categorylist = [
  CategoryModel(
      categoryname: 'Science', imageurl: 'assests/images/science.avif'),
  CategoryModel(
      categoryname: 'General', imageurl: 'assests/images/general.avif'),
  CategoryModel(categoryname: 'Sports', imageurl: 'assests/images/sports.avif'),
  CategoryModel(categoryname: 'Health', imageurl: 'assests/images/health.avif'),
  CategoryModel(
      categoryname: 'Entertaiment',
      imageurl: 'assests/images/entertaiment.avif'),
];
