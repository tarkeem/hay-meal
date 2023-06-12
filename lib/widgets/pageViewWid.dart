import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hay_meals/provider/languageProvider.dart';
import 'package:hay_meals/screens/filter.dart';
import 'package:hay_meals/screens/themeScreen.dart';
import 'package:provider/provider.dart';

Widget first(cxt) {
  bool isEng = Provider.of<languageProvider>(cxt).isEng;
  return Container(
    decoration:
        BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('image.jpg'))),
    child: Column(
      children: [
        Text(
          "cocking up",
          style: TextStyle(backgroundColor: Colors.black.withOpacity(0.4)),
        ),
        Row(
          children: [
            Text("arabic/english"),
            Switch(
                value: isEng,
                onChanged: (val) {
                  Provider.of<languageProvider>(cxt,listen: false).changeLang(val);
                })
          ],
        )
      ],
    ),
  );
}

Widget second() {
  return filter();
}

Widget third() {
  return themeSc();
}
