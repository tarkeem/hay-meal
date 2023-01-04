import 'package:flutter/material.dart';
import 'package:hay_meals/dummy_data.dart';
import 'package:hay_meals/provider/themeProvider.dart';
import 'package:hay_meals/screens/cate_screen.dart';
import 'package:hay_meals/screens/favourite.dart';
import 'package:hay_meals/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../provider/languageProvider.dart';
import '../provider/mealProvider.dart';

class bottom_bar extends StatefulWidget {
//if we declare variable in frist class in fulwidget class we can use it in second class by widget.[name of variable]
  //if we have constructor in fulwidet class.it should be in first class not the second

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
  late List pages;

  @override
  void initState() {
    //we did it so we can pass fav_list
    Provider.of<themeProvider>(context, listen: false).fetchTheme();
    Provider.of<mealProvider>(context, listen: false).fetch_filters();
    Provider.of<languageProvider>(context, listen: false).fetchLang();
    //var pref = Provider.of<languageProvider>(context,listen: true); error
    //dont put a provider that its listen:true in initstate it will make error
    // TODO: implement initState
    super.initState();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var pref = Provider.of<languageProvider>(context);
    pages = [
      {'pag': cate_sc(), 'title': pref.getText('categories')},
      {'pag': fav(), 'title': pref.getText('your_favorites')},
    ];
    bool isEng = Provider.of<languageProvider>(context).isEng;
    return Directionality(
      //to chanage the direction of text
      textDirection: isEng ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        drawer: drwer_wid(),
        appBar: AppBar(title: Text(pages[index]['title'])),
        body: pages[index]['pag'],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: pref.getText('categories')),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: pref.getText('your_favorites'))
          ],
          onTap: (val) {
            setState(() {
              index = val;
            });
          },
        ),
      ),
    );
  }
}
