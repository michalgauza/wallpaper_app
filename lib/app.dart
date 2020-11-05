import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallapers_app/page_provider.dart';
import 'package:wallapers_app/category/category.dart';
import 'package:wallapers_app/category/model/category_model.dart';

import 'home/home.dart';
import 'home/home_provider.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        )
      ],
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Flutter Demo',
        onGenerateRoute: (_) => null,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child){
          return Selector<PageProvider, CategoryModel>(
            selector: (context, pageProvider) => pageProvider.selectedCategory,
            builder: (context, value, child) {
              return Navigator(
                key: _navigatorKey,
                pages: [
                  MaterialPage(child: HomePage()),
                  if (value != null)
                    MaterialPage(child: CategoryPage(model: value))
                ],
                onPopPage: (route, result) {
                  if (route.didPop(result)) return false;
                  context.read<PageProvider>().handleCategoryTapped(null);
                  return true;
                },
              );
            },
          );
        },
      ),
    );
  }
}
