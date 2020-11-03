import 'package:flutter/material.dart';
import 'package:request_meal_app_flutter/screens/category_meals_screen.dart';
import 'package:request_meal_app_flutter/screens/filters_screen.dart';
import 'package:request_meal_app_flutter/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
     // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context)=> TabsScreen(),
        '/CategoryMealsScreen': (context)=> CategoryMealsScreen(),
        '/FiltersScreen' : (context)=> FiltersScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: TabsScreen(),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
