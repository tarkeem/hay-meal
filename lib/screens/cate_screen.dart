import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hay_meals/dummy_data.dart';
import 'package:hay_meals/provider/languageProvider.dart';
import 'package:hay_meals/provider/mealProvider.dart';
import 'package:hay_meals/widgets/cate_wid.dart';
import 'package:provider/provider.dart';

class cate_sc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pref=Provider.of<languageProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        builder:(context, snapshot) =>  AnimationLimiter(
          child: GridView(
              //try to use it with all devices screen size
              padding: EdgeInsets.all(10),
              children: Provider.of<mealProvider>(context).available_cat
                  .map((e) => AnimationConfiguration.staggeredGrid(
                   duration: const Duration(milliseconds: 2000),
                    columnCount: 5,
                    position: mealProvider().available_cat.indexOf(e),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: cate_wid(title:pref.getText('cat-${e.id}') ,
                         id: e.id, col: e.color),
                      ),
                    ),
                  ))
                  .toList(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //maxCrossAxisExtent: 400, //contoll the size of grid elemnt
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,//ratio between the height and width for each element
                mainAxisSpacing: 15,//the space between the elements vertically
                crossAxisSpacing: 10,//the space between the elements horizentally
                
              )),
        ),
      ),
    );
  }
}
