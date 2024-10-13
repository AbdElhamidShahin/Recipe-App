import 'package:dio/dio.dart';
import 'articalmodel.dart';

class RecipeService {
  final Dio _dio = Dio();

  Future<List<ArticleModel>> fetchRecipes(String keyword) async { // تعديل النوع
    final String url =
        'https://api.edamam.com/api/recipes/v2?type=public&q=$keyword&app_id=253c3edc&app_key=4344d3401f66d8bbfe3548508eefd57e';

    try {
      // Make the HTTP GET request
      final Response response = await _dio.get(url);

      // Check if the response was successful
      if (response.statusCode == 200) {
        final List recipes = response.data['hits'];

        return recipes.map<ArticleModel>((recipe) {
          return ArticleModel(
            title: recipe['recipe']['label'], // اسم الوصفة
            image: recipe['recipe']['image'], // صورة الوصفة
          );
        }).toList();
      } else {
        print('Failed to fetch recipes: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching recipes: $e');
      return [];
    }
  }
}
