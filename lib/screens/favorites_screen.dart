import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((ctx, index) {
          final meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        }),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
