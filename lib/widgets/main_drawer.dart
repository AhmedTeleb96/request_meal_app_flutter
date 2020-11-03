import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ) ,
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text("Meal",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            onTap: ()=> Navigator.of(context).pushNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 26,),
            title: Text("Filters",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: ()=> Navigator.of(context).pushNamed('/FiltersScreen'),
          )
        ],
      ),
    );
  }
}