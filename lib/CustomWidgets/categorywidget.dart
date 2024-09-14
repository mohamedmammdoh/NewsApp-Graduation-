import 'package:flutter/material.dart';

import 'package:news/Models/categorymodel.dart';
import 'package:news/Views/categoryview.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CategoryView(category: category.categoryname);
          },
        ));
        print(category.categoryname);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        width: 180,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(category.imageurl),
          ),
        ),
        child: Center(
          child: Text(
            category.categoryname,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
