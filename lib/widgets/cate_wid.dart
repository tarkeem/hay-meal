import 'package:flutter/material.dart';
import 'package:hay_meals/screens/cate_meals_sc.dart';

class cate_wid extends StatelessWidget {
  
  String title;
  String id;
  Color col;

  cate_wid({required this.title,required this.id,required this.col});


  void choosen_category(BuildContext cxt)
  {
    Navigator.of(cxt).pushNamed(
      cate_meals_sc.rout_name,

      arguments: {//send info.but it is not part of the navigated screen parameter
        'id':id,
        'title':title
      }
    
    
    );
  }


  @override
  Widget build(BuildContext context) {

    return InkWell (
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      onTap: (){choosen_category(context);},
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
    
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: col,
          gradient: LinearGradient(
            colors: [col.withOpacity(0.4),col],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
      ),
    );
    
  }
}