import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallapers_app/category/category.dart';
import 'package:wallapers_app/page_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context
                    .read<PageProvider>()
                    .handleCategoryTapped(CategoryModel(index.toString()));
              },
              child: Container(
                width: 300,
                height: 100,
                alignment: Alignment.center,
                child: Text(
                  index.toString(),
                ),
              ),
            );
          }),
    );
  }
}
