import 'package:flutter/material.dart';
import 'package:hay_meals/dummy_data.dart';
import 'package:hay_meals/models/meal.dart';
import 'package:hay_meals/provider/languageProvider.dart';
import 'package:hay_meals/provider/mealProvider.dart';
import 'package:hay_meals/provider/themeProvider.dart';
import 'package:hay_meals/screens/bottom_bar.dart';
import 'package:hay_meals/screens/cate_meals_sc.dart';
import 'package:hay_meals/screens/cate_screen.dart';
import 'package:hay_meals/screens/detail_meals_screen.dart';
import 'package:hay_meals/screens/filter.dart';
import 'package:hay_meals/screens/onboard.dart';
import 'package:hay_meals/screens/themeScreen.dart';
import 'package:provider/provider.dart';


//there is problem in filters concept



/*
sometimes you will face error like that "flutter failed to start daemon"
to solve this problem go to flutter/pub.cash and delete pub.cash
then run this command "flutter pub chache repair" and reopen the compiler

*/


/*
we cant use provider listen true in initstate

*/

/*
in both provide us with context
didchangedependances:every setstate it will excute
initstate:it just exute only one time
*/

void main() {
  runApp(MultiProvider(
    providers: [
      //use changeNotifierProvider rather than provider
      //remember to add your provider here before anything
      ChangeNotifierProvider<mealProvider>(
        create: (context) => mealProvider(),
      ),
      ChangeNotifierProvider<themeProvider>(
        create: (context) => themeProvider(),
      ),
      ChangeNotifierProvider<languageProvider>(
        create: (context) => languageProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    int primswatch = Provider.of<themeProvider>(context).primaryColor.hashCode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: Provider.of<themeProvider>(context).tm,
      darkTheme:ThemeData.dark().copyWith(
        textTheme: TextTheme(
          
              bodyText1: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(

                  fontSize: 10,
                  fontWeight: FontWeight.bold)
        ),
        primaryColor: Provider.of<themeProvider>(context).primaryColor
      ), /*ThemeData(
          canvasColor: Colors.black,
          accentColor: Colors.white,
          textTheme: ThemeData.dark().textTheme,//important to give a dark properties to it
          iconTheme: IconThemeData(
            color: Colors.red
          ),
          primaryIconTheme: ThemeData.dark().primaryIconTheme,
          primaryColor: Colors.white,
          
          //textTheme,

          /*there are two type of color
        1-Color:and it takes value as Colors.black
        2-MaterialColor:it takes value as the following code
        */
          primarySwatch: MaterialColor(
            primswatch,
            <int, Color>{
              50: Color(0xFFFCE4EC),
              100: Color(0xFFF8BBD0),
              200: Color(0xFFF48FB1),
              300: Color(0xFFF06292),
              400: Color(0xFFEC407A),
              500: Color(Colors.black.hashCode),
              600: Color(0xFFD81B60),
              700: Color(0xFFC2185B),
              800: Color(0xFFAD1457),
              900: Color(0xFF880E4F),
            },
          )),*/
      theme: ThemeData(
          backgroundColor: Colors.black.withOpacity(0.6),
          primarySwatch: Colors.pink,
          canvasColor: Color.fromARGB(255, 223, 231, 204),
          primaryColor: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
              //there is another way

              bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold))),
      //home: bottom_bar(),
      routes: {
        '/': (context) => onboard(),
        filter.rout_name: (context) => filter(),
        cate_meals_sc.rout_name: (context) => cate_meals_sc(),
        detail_meal.rout_name: (context) => detail_meal(),
        themeSc.rout_name: (context) => themeSc(),
        onboard.rout_name:(context) => onboard(),
      },
    );
  }
}
