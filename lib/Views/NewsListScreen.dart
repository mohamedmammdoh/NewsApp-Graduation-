import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Models/articlemodel.dart';
import 'package:news/services/NewsService.dart';

import 'newstitleview.dart';

class NewsListScreen extends StatelessWidget {
  final String category;

  const NewsListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<ArticleModel>>(
        future: NewsServices().GetNews(category: category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching articles.'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  title: Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    article.subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: article.imageurl != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      article.imageurl,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                      : null,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewTitleView(articleModel: article);
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No articles found.'));
          }
        },
      ),
    );
  }
}
