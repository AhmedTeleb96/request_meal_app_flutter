import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('CategoryMealsScreen',
    arguments:
        {
          'id': id,
          'title':title
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.4),
                  color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );

  }


}
