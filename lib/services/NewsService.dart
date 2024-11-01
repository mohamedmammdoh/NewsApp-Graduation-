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
      // Making the API request
      Response response = await dio.get(
<<<<<<< HEAD
          'https://newsdata.io/api/1/news?apikey=$apiKey&q=$query&country=$country');
=======
        'https://newsdata.io/api/1/news',
        queryParameters: {
          'apikey': apiKey,
          'q': query,
          'country': 'eg',
        },
      );

      if (response.statusCode == 422) {
        print('Unprocessable Entity: The request was not accepted. Please check your query.');
        return [];
      }

      if (response.statusCode == 429) {
        print('Too many requests. Please try again later.');
        return [];
      }
>>>>>>> refs/remotes/origin/master

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

    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        print('Error 422: Invalid request, please check your query syntax.');
        return [];
      } else if (e.response?.statusCode == 429) {
        print('Error 429: Too many requests. Please wait before trying again.');
        return [];
      } else {
        // Handle other errors
        print('Error searching news: ${e.message}');
        return [];
      }
    } catch (e) {
      print('Error Unexpected error: $e');
      return [];
    }
  }

}
