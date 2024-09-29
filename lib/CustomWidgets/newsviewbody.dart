import 'package:flutter/material.dart';
import 'package:news/Models/articlemodel.dart';

class NewsTitleBody extends StatelessWidget {
  const NewsTitleBody({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 60),
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(articleModel.imageurl),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                articleModel.title,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                articleModel.subtitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
