import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/model/cubit/states.dart';
import 'package:recipes_app/view/screens/FavoriteScreen.dart';
import 'package:recipes_app/view/screens/HomePage.dart';

import '../../view/Wedget/tabpar.dart';
import '../../view/screens/HomeBody.dart';
import '../ImageUpper.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super((FoodIntiatialState()));

  static FoodCubit get(context) => BlocProvider.of<FoodCubit>(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home',),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
  ];

  List<Widget> screens = [
    TabBarPage(),
    Favorite(),
     Favorite(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {}
    emit(FoodBottomnavBarState());
  }

  // List<dynamic> food = []; // اسم المتغير يمكن أن يكون صغيرًا أو كبيرًا حسب تفضيلاتك
  //
  // void getFoodData(String keyword) { // أضف parameter لاستقبال الكلمة المفتاحية
  //   emit(FoodGetDataLoadingState());
  //
  //   DioHelper.getData(
  //     url: 'api/recipes/v2', // الجزء من URL بعد baseUrl
  //     query: {
  //       'type': 'public',
  //       'q': keyword, // أضف هنا الكلمة المفتاحية
  //       'app_id': '253c3edc', // معرف التطبيق
  //       'app_key': '4344d3401f66d8bbfe3548508eefd57e', // مفتاح التطبيق
  //     },
  //   ).then((value) {
  //     // استخرج البيانات الصحيحة من الاستجابة
  //     food = value.data['hits'] ?? []; // تأكد من وجود hits
  //
  //     if (food.isNotEmpty) {
  //       // طباعة أول وصفة للتأكد
  //       var firstRecipe = food[0]['recipe'];
  //       print('First recipe title: ${firstRecipe["label"]}'); // اسم الوصفة
  //       print('Image URL: ${firstRecipe["image"]}'); // صورة الوصفة
  //       print('Cuisine Type: ${firstRecipe["cuisineType"]}'); // نوع الطعام
  //       print('Preparation Time: ${firstRecipe["totalTime"]}'); // وقت التحضير
  //
  //       emit(FoodGetDataSuccessState(food)); // تمرير البيانات إلى الحالة
  //     } else {
  //       emit(FoodGetDataErrorState( 'لا توجد وصفات متاحة.'));
  //     }
  //   }).catchError((error) {
  //     print('Error: ${error.toString()}');
  //
  //     emit(FoodGetDataErrorState(  '1234')); // تمرير الخطأ هنا
  //   });
  // }

  // List<dynamic> Search = [];
  //
  // void getSearch(String value) {
  //   emit(NewsGetSearchLodingState());
  //
  //   DioHelper.getData(
  //     url: 'v2/everything',
  //     query: {
  //       'q': '$value',
  //       'apiKey':
  //           'b09ef8e6702144b4a88f4c2adb7647eb', // تأكد من إدخال المفتاح الصحيح هنا
  //     },
  //   ).then((value) {
  //     Search = value.data['articles'];
  //
  //     print('Number of articles: ${Search.length}');
  //
  //     emit(NewsGetSearchSuccessState());
  //   }).catchError((error) {
  //     print('Error: ${error.toString()}');
  //     emit(NewsGetSearchErrorState(error: error.toString())); // تمرير الخطأ هنا
  //   });
  // }
  //
  // bool isDark = false;
  //
  // void changeAppMode() {
  //   isDark = !isDark;
  //   emit(AppChangeModeState(isDark)); // تمرير isDark مع الحالة
  // }
}
