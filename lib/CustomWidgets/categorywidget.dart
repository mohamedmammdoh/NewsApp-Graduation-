import 'package:flutter/material.dart';

import 'package:news/Models/categorymodel.dart';
import 'package:news/Views/categoryview.dart';

import 'package:flutter/material.dart';
import 'package:news/Models/categorymodel.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the category image
          Image.asset(
            category.imageurl,
            fit: BoxFit.cover,
            height: 60, // Set a height for the image
          ),
          const SizedBox(height: 8),
          // Display the category name
          Text(
            category.categoryname,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

