import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //The width for each item at the gridview
        //ratio between the height and width of each item 3 for height (300) and 2 for width (200)
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20, //Spacing between items next each other
        crossAxisSpacing: 20, //Spacing between items under each other
      ),
      children: DUMMY_CATEGORIES.map((categoryData) {
        return CategoryItems(
          categoryData.id,
          categoryData.title,
          categoryData.color,
        );
      }).toList(),
    );
  }
}
