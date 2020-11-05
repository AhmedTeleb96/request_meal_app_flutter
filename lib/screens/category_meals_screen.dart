import 'package:flutter/material.dart';
import 'package:request_meal_app_flutter/models/Meal.dart';
import 'package:request_meal_app_flutter/widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {


  @override
  Widget build(BuildContext context) {

    final routArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId=routArgs['id'];
    final categoryTitle=routArgs['title'];
    final categoryMeals= widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body:  ListView.builder(
        itemBuilder: (context,index){
           return MealItem(
             id: categoryMeals[index].id,
             imageUrl:  categoryMeals[index].imageUrl,
             title: categoryMeals[index].title,
             duration: categoryMeals[index].duration,
             complexity: categoryMeals[index].complexity,
             affordability: categoryMeals[index].affordability,
           );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
