import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import 'screens/meals_Screen.dart';
import 'screens/categories_screen.dart';
import './models/filter_data.dart';
import './models/meal.dart';

import './dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filter = Filters(
      glutenFree: false, lactoseFree: false, vegetarian: false, vegan: false);

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Filters filterData) {
    setState(() {
      _filter = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter.glutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_filter.lactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (_filter.vegetarian && !meal.isVegetarian) {
          return false;
        }
        if (_filter.vegan && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold)));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filter, _setFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
