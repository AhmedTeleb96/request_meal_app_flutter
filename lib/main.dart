import 'package:flutter/material.dart';
import 'package:request_meal_app_flutter/dummy_data.dart';
import 'package:request_meal_app_flutter/models/Meal.dart';
import 'package:request_meal_app_flutter/screens/category_meals_screen.dart';
import 'package:request_meal_app_flutter/screens/filters_screen.dart';
import 'package:request_meal_app_flutter/screens/meal_detail_screen.dart';
import 'package:request_meal_app_flutter/screens/tabs_screen.dart';

void main() {
  runApp(MyHomePage());
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String,bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false
  };

    List<Meal> _availableMeals= DUMMY_MEALS;
    List<Meal> _favoriteMeals= [];

    void _toggleFavorite(String mealId){

      final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

      if(existingIndex >=0)
        {
          setState(() {
            _favoriteMeals.removeAt(existingIndex);
          });
        }else
          {
            setState(() {
              _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
            });
          }
    }

    bool _isFavoriteMeal(String id){
      return _favoriteMeals.any((meal) => meal.id == id);
    }
    void _setFilters(Map<String,bool> _filterData){
      setState(() {
      _filters = _filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {

        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: Colors.amber,
          primarySwatch : Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1)
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context)=> TabsScreen(_favoriteMeals),
        '/CategoryMealsScreen': (context)=> CategoryMealsScreen(_availableMeals),
        '/FiltersScreen' : (context)=> FiltersScreen(_filters,_setFilters),
        '/MealDetailScreen' : (context) => MealDetailScreen(_toggleFavorite , _isFavoriteMeal)
      },
    );
  }
}
