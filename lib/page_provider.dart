import 'package:flutter/material.dart';
import 'package:wallapers_app/category/category.dart';

class PageProvider with ChangeNotifier {
  CategoryModel selectedCategory;

  handleCategoryTapped(CategoryModel category) {
    selectedCategory = category;
    notifyListeners();
  }
}
