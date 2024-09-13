import 'package:dio/dio.dart';
import 'package:news/Models/articlemodel.dart';

class NewsServices {
  final dio = Dio();
  final String apiKey = 'pub_531734e1d692425f264129c2af49c1c6928f7';
  Future<List<ArticleModel>> GetNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/latest?apikey=$apiKey&country=eg&category=$category');

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
    } on Exception catch (e) {
      return [];
    }
  }
}
