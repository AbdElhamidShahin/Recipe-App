// import 'package:dio/dio.dart';
// import 'articalmodel.dart';
//
// class RecipeService {
//   final Dio _dio = Dio();
//
//   Future<List<ArticleModel>> fetchRecipes(String keyword) async {
//     final String url =
//         'https://api.edamam.com/api/recipes/v2?type=public&q=$keyword&app_id=253c3edc&app_key=4344d3401f66d8bbfe3548508eefd57e';
//
//     try {
//       final Response response = await _dio.get(url);
//
//       if (response.statusCode == 200) {
//         final List recipes = response.data['hits'];
//
//         return recipes.map<ArticleModel>((recipe) {
//           final recipeData = recipe['recipe'];
//           final totalNutrients = recipeData['totalNutrients'];
//           // استخدم dishType المتوفر في recipeData
//           final List<dynamic> dishTypes = recipeData['dishType'] ?? []; // تأكد من استخدام الصيغة الصحيحة
//           String dishType = dishTypes.isNotEmpty ? dishTypes[0] : 'غير محدد'; // إذا كانت الأنواع متاحة، استخدم أول نوع
//
//
//
//           return ArticleModel(
//             title: recipeData['label'],
//             image: recipeData['image'],
//             ingredientLines: List<String>.from(recipeData['ingredientLines']),
//             calories: totalNutrients['ENERC_KCAL']['quantity'],
//             fat: totalNutrients['FAT']['quantity'],
//             protein: totalNutrients['PROCNT']['quantity'],
//             carbohydrates: totalNutrients['CHOCDF']['quantity'],
//             servings: recipeData['yield']?.toInt() ?? 1,
//             category: dishType, // تمرير التصنيف كنوع
//           );
//         }).toList();
//       } else {
//         print('Failed to fetch recipes: ${response.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       print('Error fetching recipes: $e');
//       return [];
//     }
//   }
// }
