import 'package:flutter/material.dart';
import 'package:meals_app/providers/meals.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Meals>(
      builder: (context, meals, child) {
        final favoritMeals = meals.favoriteMeals;
        return favoritMeals.isEmpty
            ? const Center(
                child: Text(
                  'You have no favorites yet - start adding some!',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: favoritMeals.length,
                itemBuilder: (ctx, index) {
                  return MealItem(mealData: favoritMeals[index]);
                },
              );
      },
    );
  }
}
