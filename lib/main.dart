import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_screen.dart';
import 'package:meals_app/providers/meals.dart';
import 'package:provider/provider.dart';

import './pages/categories_screen.dart';
import './pages/category_meals_screen.dart';
import './pages/meal_detail_screen.dart';
import './pages/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Meals(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              ),
        ),
        //home: CategoriesScreen(),
        //initialRoute: '/', //default is '/'
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
        },

        //used to reach a specific page when reach a page
        /*
        onGenerateRoute: (settings) {
          print(settings.arguments);
          if (settings.arguments == '/meal-detail') {
            return ...
          } else if (settings.name == '/something-else') {
            return ...
          }
          return MaterialPageRoute(
            builder: (ctx) => CategoriesScreen(),
          );
        },*/

        //used when reach unknown page or when app crash so instead we show something (page) on the screen for the user
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
      ),
    );
  }
}
