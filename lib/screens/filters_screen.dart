import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget buildSwitchListTile(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title), value: currentValue, onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 26),
            ),
          ),
          buildSwitchListTile(
            "Gluten-Free",
            _glutenFree,
            (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          buildSwitchListTile(
            "Lactose-Free",
            _lactoseFree,
                (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          buildSwitchListTile(
            "Vegan",
            _vegan,
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
          buildSwitchListTile(
            "Vegetarian",
            _vegetarian,
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),

        ],
      ),
    );
  }
}
