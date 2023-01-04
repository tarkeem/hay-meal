import 'package:flutter/material.dart';
import 'package:hay_meals/dummy_data.dart';
import 'package:hay_meals/provider/mealProvider.dart';
import 'package:hay_meals/widgets/cate_meals_item.dart';
import 'package:provider/provider.dart';


class cate_meals_sc extends StatefulWidget {
static String rout_name='meals_cate_rout';  
  @override
  State<cate_meals_sc> createState() => _cate_meals_scState();
}

class _cate_meals_scState extends State<cate_meals_sc> {

  
  late String cateid;
  late String catetitle;
  late List CateMeals;

  @override
  
/*void didChangeDependencies() { //it will not work
    // TODO: implement didChangeDependencies
    var routargu=ModalRoute.of(context)?.settings.arguments as Map; //put it in built fun so it can see context
    cateid= routargu['id'];
    catetitle=routargu['title'];
    CateMeals=DUMMY_MEALS.where((meal){

      return meal.categories.contains(cateid);
    }
    
    ).toList();
  }*/


  

  


  @override
  Widget build(BuildContext context) {
List filtered_dummy=Provider.of<mealProvider>(context).filtered_meals;
    //i pass map of info before the navigation so the following line will get this map
    var routargu=ModalRoute.of(context)?.settings.arguments as Map; //put it in built fun so it can see context
    cateid= routargu['id'];
    catetitle=routargu['title'];
    CateMeals=filtered_dummy.where((meal){

      return meal.categories.contains(cateid);
    }
    
    ).toList();
    

    return  Scaffold(
      appBar: AppBar(
        title: Text(catetitle),
      ),
      body: ListView.builder(
      itemCount:CateMeals.length ,
      itemBuilder: (cxt,n){
        return meal_item(
          id: CateMeals[n].id,
          title: CateMeals[n].title,
          affordability:CateMeals[n].affordability,
          complexity:CateMeals[n].complexity,
          duration:CateMeals[n].duration,
          image_str:CateMeals[n].imageUrl,
           
          );
      }
      ),
    );
    
  }
}