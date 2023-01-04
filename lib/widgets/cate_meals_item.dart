import 'package:flutter/material.dart';
import 'package:hay_meals/models/meal.dart';
import 'package:hay_meals/screens/detail_meals_screen.dart';



class meal_item extends StatelessWidget {

  String id;
  String image_str;
  String  title;
  int duration;
  Complexity complexity;
  Affordability affordability;
  //Function delet;
  meal_item({
    required  this.id,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.image_str,
    //required this.delet
  }
  );
  
  choosen_item(cxt)
  {
    Navigator.pushNamed(cxt, detail_meal.rout_name,
    arguments:id 
    
    );
    /*.then((returned_meal_id) {
      if(returned_meal_id!=null)
      {
      delet(returned_meal_id);
      print(returned_meal_id);
      }
    } 
    );*/
  }


  String get complextext
  {
    switch(complexity)
    {
      case Complexity.Challenging:return 'challenging';break;
      case Complexity.Simple:return 'simple';break;
      case Complexity.Hard:return 'hard';break;
      default:return 'unkown';
    }
  }

String get affordabilitytext
  {
    switch(affordability)
    {
      case Affordability.Affordable:return 'affordable';break;
      case Affordability.Luxurious:return 'luxurious';break;
      case Affordability.Pricey:return 'pricey';break;
      default:return 'unkown';
    }
  }



  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:()=>choosen_item(context) ,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child:Hero(tag: id ,child: Image.network(image_str,height: 200,fit:BoxFit.cover ,width: double.infinity,)) ,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight:Radius.circular(15)
                  ),
                  
                ),
                Positioned( //try use alignment
                  bottom: 20,
                  left: 250,
                  child: Container(
                  width: 200,
                  color: Colors.black.withOpacity(0.3),
                  child: Text(
                    title,
                    style:TextStyle(fontSize: 25,color: Colors.white) ,
                    softWrap: true,
                    ),
                )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [Icon(Icons.lock_clock),SizedBox(width: 3,),Text('$duration')],),
                Row(children: [Icon(Icons.work),SizedBox(width: 3,),Text(complextext)],),
                Row(children: [Icon(Icons.monetization_on),SizedBox(width: 3,),Text(affordabilitytext)],)
              ],
            )
          ],
        ),

      ) ,
    );

    
  }
}