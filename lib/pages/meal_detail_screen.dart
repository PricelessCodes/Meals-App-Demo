import 'package:flutter/material.dart';
import 'package:meals_app/providers/meals.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  //It is better to but this widget in a separite file as we call Theme in it so it will update the whole
  //MealDetailScreen widget but it is not needed at this app because we do not change our theme at the app (headline6)
  //and also we call Them at the build method of this widget so it will not make a difference anyway.
  Widget buildSectionTitle(BuildContext ctx, String titleText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildFloatingActionButton(
      IconData icon, Function onPressedHandler, String heroTagText) {
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: onPressedHandler(),
      heroTag: heroTagText,
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMeal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title} Recipe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (cxt, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider(
                      //color: Theme.of(context).accentColor,
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<Meals>(
        builder: (ctx, meals, child) {
          return FloatingActionButton(
            child: Icon(
              meals.isMealFavorite(selectedMeal.id)
                  ? Icons.star
                  : Icons.star_border,
            ),
            onPressed: () => meals.toggleFavoriteMeal(selectedMeal.id),
          );
        },
      ),
    );
  }
}
