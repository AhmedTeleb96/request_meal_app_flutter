import 'package:flutter/material.dart';
import 'package:request_meal_app_flutter/models/Meal.dart';
import 'package:request_meal_app_flutter/screens/CategoriesScreen.dart';
import 'package:request_meal_app_flutter/screens/favorites_screen.dart';
import 'package:request_meal_app_flutter/widgets/main_drawer.dart';


class TabsScreen extends StatefulWidget {

   final List<Meal> _favoriteMeals;
   final List<Meal> _availableMeals;
   final Function _toggleFavorite ;
   final Function _isFavoriteMeal;
   final Function saveFilters;
   final Map<String,bool> currentFilters;

  TabsScreen(this._favoriteMeals,this._availableMeals,this._toggleFavorite,this._isFavoriteMeal,this.currentFilters,this.saveFilters);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

   List<Map<String,Object>> _pages ;

   @override
   initState()
   {
     _pages =
     [
       {
         'page' : CategoriesScreen(widget._availableMeals,widget._toggleFavorite,widget._isFavoriteMeal),
         'title' : 'Categories'
       },
       {
         'page' : FavoritesScreen(widget._favoriteMeals,widget._toggleFavorite,widget._isFavoriteMeal),
         'title' : 'Your Favorites'
       }
     ];

     super.initState();
   }
  int _selectedPageIndex=0;
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor ,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon:Icon( Icons.category),
              label: "categories"
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.favorite_border),
              label: "Favorites"
          ),
        ],
      ),
      drawer: MainDrawer(widget.currentFilters,widget.saveFilters),
    );
  }


}
