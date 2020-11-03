import 'package:flutter/material.dart';
import 'package:request_meal_app_flutter/screens/CategoriesScreen.dart';
import 'package:request_meal_app_flutter/screens/favorites_screen.dart';
import 'package:request_meal_app_flutter/widgets/main_drawer.dart';


class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String,Object>> _pages =
  [
    {
      'page' : CategoriesScreen(),
      'title' : 'Categories'
    },
    {
      'page' : FavoritesScreen(),
      'title' : 'Your Favorites'
    }
  ];

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
              title: Text("categories")
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.favorite_border),
              title: Text("Favorites")
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
