import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hay_meals/provider/themeProvider.dart';
import 'package:hay_meals/widgets/themeWid.dart';
import 'package:provider/provider.dart';

class themeSc extends StatelessWidget {
  static String rout_name = "/theme";

  @override
  Widget build(BuildContext context) {
    ThemeMode curTheme = Provider.of<themeProvider>(context).tm;
    return Scaffold(
      appBar: AppBar(
        title: Text('theme'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            radio_list_Tile("system theme",ThemeMode.system, curTheme, context),
            radio_list_Tile("light theme",ThemeMode.light, curTheme, context),
            radio_list_Tile("dark theme",ThemeMode.dark, curTheme,context ),
            SizedBox(height: 10,),
            colorPicker_List_Tile("primary color", Icons.change_circle, context,0),
             colorPicker_List_Tile("accent color", Icons.change_circle, context,1)
          ],

        ),
      ),
    );
  }
}
