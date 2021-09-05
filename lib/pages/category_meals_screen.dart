import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meals_app/providers/meals.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String? categoryId = routeArgs['id'];
    String? _categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$_categoryTitle Recipes'),
      ),
      body: Consumer<Meals>(
        builder: (ctx, meals, ch) {
          List<Meal> catMeals;
          if (categoryId != null)
            catMeals = meals.getMealsByCategoryId(categoryId);
          else
            catMeals = [];
          return ListView.builder(
            itemCount: catMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                mealData: catMeals[index],
                //deleteMealItemHandler: _removeMeal,
              );
            },
          );
        },
      ),
    );
  }
}
