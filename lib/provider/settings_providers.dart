
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{

  ThemeMode currentTheme = ThemeMode.light ;



  void changeTheme(ThemeMode newMode){
    currentTheme = newMode ;
    notifyListeners();
  }

  bool isDarkMode(){
    return currentTheme == ThemeMode.dark ;
  }

}