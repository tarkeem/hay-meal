import 'package:flutter/material.dart';
import 'package:hay_meals/provider/mealProvider.dart';
import 'package:hay_meals/widgets/cate_meals_item.dart';
import 'package:provider/provider.dart';

class fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<mealProvider>(context, listen: false).fetch_fav_meal();
    List fav_list = Provider.of<mealProvider>(context).favourit_meal;
    return Scaffold(
      appBar: AppBar(),
      body: fav_list.isEmpty
          ? Center(
              child: Text('it is empty'),
            )
          : ListView.builder(
              itemCount: fav_list.length,
              itemBuilder: (cxt, n) {
                return meal_item(
                  id: fav_list[n].id,
                  title: fav_list[n].title,
                  affordability: fav_list[n].affordability,
                  complexity: fav_list[n].complexity,
                  duration: fav_list[n].duration,
                  image_str: fav_list[n].imageUrl,
                );
              }),
    );
  }
}
