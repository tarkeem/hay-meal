import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../provider/themeProvider.dart';

Widget radio_list_Tile(text, val, groubval, cxt) {
  return RadioListTile(
      title: Text(text),
      value: val,
      groupValue: groubval,
      onChanged: (newval) {
        Provider.of<themeProvider>(cxt, listen: false).setThemeMode(newval);
      });
}

Widget colorPicker_List_Tile(tex, icon, cxt, int n) {
  Color primcol = Provider.of<themeProvider>(cxt).primaryColor;
  var prov = Provider.of<themeProvider>(cxt);
  return ListTile(
    title: Text(tex),
    leading: Icon(icon),
    trailing: CircleAvatar(
      backgroundColor:n==0? primcol:prov.accentColor,
    ),
    onTap: () {
      showDialog(
          context: cxt,
          builder: (cxt) => AlertDialog(
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: n == 0
                        ? prov.primaryColor
                        : prov.accentColor /*primco not work */,
                    onColorChanged: (newcol) {
                      n == 0
                          ? Provider.of<themeProvider>(cxt, listen: false)
                              .setPrimeColor(newcol)
                          : Provider.of<themeProvider>(cxt, listen: false)
                              .setaccentColor(newcol);
                    },
                  ),
                ),
              ));
    },
  );
}
