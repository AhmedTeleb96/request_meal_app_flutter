import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:request_meal_app_flutter/models/Meal.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
     @required this.id,
     @required this.imageUrl,
     @required this.title,
     @required this.duration,
     @required this.complexity,
     @required this.affordability
    });

  String get comlexityText
  {
    switch(complexity){
      case Complexity.Simple: return 'Simple'; break;
      case Complexity.Challenging: return 'Challenging'; break;
      case Complexity.Hard: return 'Hard'; break;
      default: return 'Unknown'; break;
    }
  }

  String get affordabilityText
  {
    switch(affordability){
      case Affordability.Affordable: return 'Affordable'; break;
      case Affordability.Pricey: return 'Pricey'; break;
      case Affordability.Luxurious: return 'Luxurious'; break;
      default: return 'Unknown'; break;
    }
  }

 /* selectMeal(BuildContext ctx)
  {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.push(ctx, new MaterialPageRoute(
        builder: (ctx) => new MealDetailScreen(),
        settings: RouteSettings(
            arguments: id
        ),
      )
      );
    });

  }*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: selectMeal(context),
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 220,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26,color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text("$comlexityText")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text("$affordabilityText")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

