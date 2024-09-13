import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/Listviewbuilder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListviewBuilder(category: category),
      ),
    );
  }
}
