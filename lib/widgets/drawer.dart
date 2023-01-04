import 'package:flutter/material.dart';
import 'package:hay_meals/provider/languageProvider.dart';
import 'package:hay_meals/screens/filter.dart';
import 'package:hay_meals/screens/themeScreen.dart';
import 'package:provider/provider.dart';

class drwer_wid extends StatelessWidget {
  Widget list_tile(
      String tex,
      IconData icon,
      Function()
          fun) //it cant accept type function so change it into voidcallback
  {
    return ListTile(
      onTap: () =>
          fun(), //to pass the name of function directly change the typr from function to voidcallback
      leading: Icon(icon),
      title: Text(
        tex,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   var pref = Provider.of<languageProvider>(context);
    return Directionality (
      textDirection:pref.isEng?TextDirection.ltr:TextDirection.rtl,
      child: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              width: double.infinity,
              height: 100,
              child: Text(
                pref.getText('drawer_name'),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            list_tile(pref.getText('drawer_item1'), Icons.food_bank, () {
              Navigator.of(context).pushNamed('/');
            }),
            list_tile(pref.getText('drawer_item2'), Icons.settings, () {
              Navigator.of(context).pushNamed(filter.rout_name);
            }),
            list_tile(pref.getText('drawer_item3'), Icons.settings, () {
              Navigator.of(context).pushNamed(themeSc.rout_name);
            }),
            SwitchListTile(
                value:pref.isEng,
                onChanged: (val) {
                  Provider.of<languageProvider>(context, listen: false)
                      .changeLang(val);
                },
                title: Text('English/Arabic'),
                )
          ],
        ),
      ),
    );
  }
}
