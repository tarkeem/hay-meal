import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hay_meals/models/category.dart';
import 'package:hay_meals/models/meal.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';

class mealProvider extends ChangeNotifier {
  //if static was not written (Try replacing the reference to the instance member with a different) will appear

  Map<String, bool> filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };
  List<Meal> filtered_meals = DUMMY_MEALS;
  List<Category> available_cat = [];
  setGluten(bool val) {
    print(val);
    filters['isGlutenFree'] = val;
    notifyListeners();
  }

  setLactose(bool val) {
    print(val);
    filters['isLactoseFree'] = val;
    notifyListeners();
  }

  setVegan(bool val) {
    print(val);
    filters['isVegan'] = val;
    notifyListeners();
  }

  setVegetarian(bool val) {
    print(val);
    filters['isVegetarian'] = val;
    notifyListeners();
  }

  //this function should execute after modifing filters map to make modification on filtered_meals that shows meals to user
  void set_filters(Map<String, bool> filter) async {
    filters = filter;
    filtered_meals = DUMMY_MEALS.where((ele) {
      if (filters['isGlutenFree']! && ele.isGlutenFree) {
        true;
      }
      if (filters['isLactoseFree']! && ele.isLactoseFree) {
        return true;
      }
      if (filters['isVegan']! && ele.isVegan) {
        return true;
      }
      if (filters['isVegetarian']! && ele.isVegetarian) {
        return true;
      }

      /*if ((filters['isGlutenFree']! && ele.isGlutenFree) &&
          (filters['isLactoseFree']! && ele.isLactoseFree) &&
          (filters['isVegan']! && ele.isVegan) &&
          (filters['isVegetarian']! && ele.isVegetarian)) {
        return true;
      }*/
      else {
        return false;
      }
    }).toList();

    notifyListeners();
    //if i put shared pref in main of the class that what will happen
    //every change in filters map will be listened in every line code in
    //peogram but i will still need to execute the operation of
    //setting the values to shared pref so i should shared_pref_set
    //in the function that change filters map or make new function wich
    //be called after any change
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("gluten_free", filters['isGlutenFree']!);
    pref.setBool("lactos_free", filters['isLactoseFree']!);
    pref.setBool("vegan", filters['isVegan']!);
    pref.setBool("vegetarian", filters['isVegetarian']!);

    //list.contains is different from list.any

    

    //i dont need real time change because every time this fun execute i will
    //back then the meal cat will reload
    //try to improve the following code and use shared pref for avilable cat
    filtered_meals.forEach((mealElement) {
      mealElement.categories.forEach((catelement) {
        DUMMY_CATEGORIES.forEach((cat) {
          if (cat.id == catelement&&!available_cat.contains(cat)) {
            available_cat.add(cat);
          }
        });
      });
    });
  }

  void fetch_filters() async {
    //use getbBool not get
    SharedPreferences pref = await SharedPreferences.getInstance();
    //i use ?? because at first time i use this function the will not
    //be any value set in shared pref
    filters['isGlutenFree'] = pref.getBool("gluten_free") ?? true;
    filters['isLactoseFree'] = pref.getBool("lactos_free") ?? false;
    filters['isVegan'] = pref.getBool("vegan") ?? false;
    filters['isVegetarian'] = pref.getBool("vegetarian") ?? false;
    notifyListeners();
  }

  List favourit_meal = [];
  List<String> favourit_meal_id = [];

  void add_remove_to_favourit(String id_meal) async {
    int index_check;
    index_check = favourit_meal_id.indexWhere((element) => element == id_meal);
    if (index_check >= 0) {
      favourit_meal_id.removeAt(index_check);
    } else {
      favourit_meal_id.add(id_meal);
    }
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("favMeal", favourit_meal_id);
  }

  void fetch_fav_meal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    favourit_meal_id = pref.getStringList("favMeal") ?? [];
    favourit_meal = DUMMY_MEALS.where((element) {
      for (String i in favourit_meal_id) {
        if (element.id == i) {
          return true;
        }
      }

      return false;
    }).toList();
    notifyListeners();
  }

  //this fun will not change any value so we dont write notifiylistener
  bool is_in_fav(String id) {
    return favourit_meal_id.any((element) => element == id);
  }
}
