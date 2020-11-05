import 'package:flutter/material.dart';

import '../category.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel model;

  const CategoryPage({@required this.model}) : assert(model != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(model.title),
      ),
    );
  }
}
