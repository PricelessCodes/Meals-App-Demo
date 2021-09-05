import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class Meals with ChangeNotifier {
  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> get favoriteMeals {
    return [..._favoriteMeals];
  }

  Map<String, bool> get filters {
    return {..._filters};
  }

  void setFilters(Map<String, bool> filters) {
    _filters = filters;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten-free']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose-free']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }

  List<Meal> getMealsByCategoryId(String categoryId) {
    return _availableMeals
        .where((meal) => meal.categories.containsKey(categoryId))
        .toList();
  }

  void toggleFavoriteMeal(String mealId) {
    final int existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex != -1) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals
          .add(_availableMeals.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  bool isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }
}
