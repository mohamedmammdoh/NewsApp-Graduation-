import 'package:dio/dio.dart';
import 'package:news/Models/articlemodel.dart';

class NewsServices {
  final dio = Dio();
  final String apiKey = 'pub_50222c909c868ed08b304dd599d745b1b2298';
  final String country = 'eg';

  Future<List<ArticleModel>> GetNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsdata.io/api/1/latest?apikey=$apiKey&country=$country&category=$category',
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> results = jsonData['results'];
      List<ArticleModel> articles_list = [];
      for (var article in results) {
        ArticleModel articleModel = ArticleModel(
          imageurl: article['image_url'],
          subtitle: article['description'],
          title: article['title'],
        );
        articles_list.add(articleModel);
      }
      return articles_list;
    } catch (e) {
      return [];
    }
  }

  Future<List<ArticleModel>> searchNews({required String query}) async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/news?apikey=$apiKey&q=$query&country=eg');
      if (response.statusCode == 429) {
        print('Too many requests. Please try again later.');
        return [];
      }
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> results = jsonData['results'];
      List<ArticleModel> articlesList = [];
      for (var article in results) {
        ArticleModel articleModel = ArticleModel(
          imageurl: article['image_url'],
          subtitle: article['description'],
          title: article['title'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } on Exception catch (e) {
      print('Error searching news: $e');
      return [];
    }
  }
}
