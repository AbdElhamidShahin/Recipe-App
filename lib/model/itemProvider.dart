// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:recipes_app/model/articalmodel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class ItemProvider with ChangeNotifier {
//   Map<String, List<Recipe>> _items = {};
//
//   ItemProvider() {
//     _loadItems();
//   }
//
//   // Getter to retrieve items for a specific day
//   List<Recipe> getItems(String day) {
//     return _items[day] ?? [];
//   }
//
//   // Method to add an exercise to a specific day
//   void addItem(String day, Recipe item) {
//     if (_items.containsKey(day)) {
//       _items[day]?.add(item);
//     } else {
//       _items[day] = [item];
//     }
//     _saveItems();
//     ('Item added to $day: ${item.name}'); // أضف هذا السطر
//     notifyListeners();
//   }
//
//   // Method to remove an exercise from a specific day
//   void removeItem(String day, Recipe item) {
//     _items[day]?.remove(item);
//     _saveItems();
//     notifyListeners();
//   }
//
//   void _saveItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = _items.map((key, value) => MapEntry(key, jsonEncode(value)));
//     await prefs.setString('items', jsonEncode(data));
//   }
//
//   void _loadItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString('items');
//     if (data != null) {
//       final Map<String, dynamic> json = jsonDecode(data);
//       _items = json.map((key, value) => MapEntry(key, (jsonDecode(value) as List).map((e) => Recipe.fromJson(e)).toList()));
//       notifyListeners();
//     }
//   }
// }