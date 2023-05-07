import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class themeProvider extends ChangeNotifier {
  ThemeMode tm = ThemeMode.light;

  String get _thememode_str {
    if (tm == ThemeMode.system) {
      return 's';
    } else if (tm == ThemeMode.dark) {
      return 'd';
    } else {
      return 'l';
    }
  }

  ThemeMode _thememode_tm(String str) {
    if (str == 's') {
      return ThemeMode.system;
    } else if (str == 'd') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  void setThemeMode(ThemeMode newval) async {
    tm = newval;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('theme', _thememode_str);
  }

  Color primaryColor = Colors.blue;
  void setPrimeColor(Color col) async {
    primaryColor = col;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('primcol', col.value);
  }

  Color accentColor = Colors.grey;
  void setaccentColor(Color col) async {
    accentColor = col;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('acccol', col.value);
  }

  void fetchTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    primaryColor = Color(pref.getInt('primcol')??Colors.blue.value);
    accentColor = Color(pref.getInt('acccol')??Colors.pink.value);
    tm = _thememode_tm(pref.getString('theme')??'s');
    notifyListeners();
  }
}
