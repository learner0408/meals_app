import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/meals-Screen';
  //const MealsScreen({Key? key}) : super(key: key);

  // final String CategoryId;
  // final String CategoryTitle;

  // MealsScreen(this.CategoryId, this.CategoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle as String)),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          final meal = categoryMeals[index];
          return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability);
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
