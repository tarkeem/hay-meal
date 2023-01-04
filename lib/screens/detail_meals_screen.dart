import 'package:flutter/material.dart';
import 'package:hay_meals/dummy_data.dart';
import 'package:hay_meals/provider/mealProvider.dart';
import 'package:provider/provider.dart';


class detail_meal extends StatefulWidget {

static String rout_name='detail_meals_rout';


  @override
  State<detail_meal> createState() => _detail_meal();
}


class _detail_meal extends State<detail_meal> {

  @override
  Widget build(BuildContext context) {
    var id= ModalRoute.of(context)?.settings.arguments as String; //i send here one value from pre page so no need to deal with map
    var meal=DUMMY_MEALS.firstWhere((mealObj) =>mealObj.id==id );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:Icon(Provider.of<mealProvider>(context,listen: true).is_in_fav(id)?Icons.delete :Icons.favorite),
        onPressed: (){
          Provider.of<mealProvider>(context,listen: false).add_remove_to_favourit(id); 
        
        
        },

      ),
      appBar: AppBar(
        title: Text(meal.title),
      ),

      body:SingleChildScrollView (
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 300,
                  child:Hero(tag: id,child:Image.network(meal.imageUrl,fit: BoxFit.cover,)),
                  
                ),
          
                Text('ingredients',style: TextStyle(fontSize: 25,color: Colors.black),),
                build_bordered_widget(ListView.builder( //set wid and heaight of container because listview take all available height so it can cover other element
                    itemCount: meal.ingredients.length,
                    itemBuilder: (cxt,n){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.yellow,
                          child: Text(meal.ingredients[n],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                          )
                          ),
                      );
                    }
                    ),
                    ),

                 Text('steps',style: TextStyle(fontSize: 25,color: Colors.black),),

                  build_bordered_widget(ListView.builder( 
                    itemCount: meal.steps.length,
                    itemBuilder: (cxt,n){
                      return Column(
                        children: [
                          Card(
                            color: Colors.yellow,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child:ListTile (
                                leading: CircleAvatar(
                                  child: Text('#${n+1}'),
                                ),
                                title: Text(meal.steps[n],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                            ),
                            Divider(color: Colors.black,)
                        ],
                      );
                    }
                    ),)
          
              ],
            ),
          ),
      );
    
  }

  Container build_bordered_widget(Widget child) {
    return Container(
            //alignment: Alignment.center, //uselees because the child is listview
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child:child 
          );
  }
}