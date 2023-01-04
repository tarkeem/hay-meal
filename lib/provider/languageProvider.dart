import 'package:flutter/material.dart';
import 'package:hay_meals/assets/language/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class languageProvider extends ChangeNotifier {
  bool isEng = true;
  void changeLang(bool val) async {
    isEng = val;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isEng', val);
  }

  void fetchLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isEng = pref.getBool('isEng')!;
    notifyListeners();
  }

  getText(String text) {
    if (isEng) {
      return textsEn[text];
    } else {
      return textsAr[text];
    }
  }
}
