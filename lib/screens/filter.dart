import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hay_meals/provider/mealProvider.dart';
import 'package:provider/provider.dart';

class filter extends StatefulWidget {
  static String rout_name = 'filter';

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  @override
  /*void didChangeDependencies() {
    // TODO: implement didChangeDependencies
     Provider.of<mealProvider>(context,listen: false).fetch_filters();
  }*/

  bool isGlutenFree = true;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  @override
  Widget build(BuildContext context) {
    Map<String, bool> curr_filter =
        Provider.of<mealProvider>(context, listen: true).filters;

    isGlutenFree = curr_filter['isGlutenFree']!;
    isLactoseFree = curr_filter['isLactoseFree']!;
    isVegan = curr_filter['isVegan']!;
    isVegetarian = curr_filter['isVegetarian']!;
    return Scaffold(
        appBar: AppBar(
          title: Text('filter'),
          actions: [
            IconButton(
                onPressed: () {
                  Map<String, bool> value_filter = {
                    'isGlutenFree': isGlutenFree,
                    'isLactoseFree': isLactoseFree,
                    'isVegan': isVegan,
                    'isVegetarian': isVegetarian,
                  };
                  Provider.of<mealProvider>(context, listen: false).set_filters(
                      value_filter); //we use widget because the fun is global in this file so it make it easier to fitch a fun
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.yellow,
              child: Text(
                'optimize your filters',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  newMethod('GlutenFree', isGlutenFree, (curr) {
                    Provider.of<mealProvider>(context, listen: false)
                        .setGluten(curr);
                    Provider.of<mealProvider>(context, listen: false)
                        .set_filters(curr_filter);
                  }),
                  newMethod('LactoseFree', isLactoseFree, (curr) {
                    Provider.of<mealProvider>(context, listen: false)
                        .setLactose(curr);
                    Provider.of<mealProvider>(context, listen: false)
                        .set_filters(curr_filter);
                  }),
                  newMethod('Vegan', isVegan, (curr) {
                    Provider.of<mealProvider>(context, listen: false)
                        .setVegan(curr);
                    Provider.of<mealProvider>(context, listen: false)
                        .set_filters(curr_filter);
                  }),
                  newMethod('Vegetarian', isVegetarian, (curr) {
                    Provider.of<mealProvider>(context, listen: false)
                        .setVegetarian(curr);
                    Provider.of<mealProvider>(context, listen: false)
                        .set_filters(curr_filter);
                  }),
                ],
              ),
            )
          ],
        ));
  }

  SwitchListTile newMethod(String ti, bool val, Function(bool curr) fun) {
    return SwitchListTile(title: Text(ti), value: val, onChanged: fun);
  }
}
