import 'package:flutter/material.dart';
import 'package:news/Models/categorymodel.dart';
import 'package:news/CustomWidgets/categorywidget.dart';

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
      categoryname: 'science', imageurl: 'assests/images/science.avif'),
  CategoryModel(
      categoryname: 'business', imageurl: 'assests/images/business.avif'),
  CategoryModel(categoryname: 'Sports', imageurl: 'assests/images/sports.avif'),
  CategoryModel(
      categoryname: 'politics', imageurl: 'assests/images/politics.jpeg'),
  CategoryModel(
      categoryname: 'entertainment',
      imageurl: 'assests/images/entertaiment.avif'),
  CategoryModel(
      categoryname: 'technology', imageurl: 'assests/images/techonlogy.jpeg'),
  CategoryModel(
      categoryname: 'education', imageurl: 'assests/images/education.jpeg'),
];
