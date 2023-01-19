import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimaryColor = Color(0xFF5D9CEC);
  static const Color darkPrimaryColor = Color(0xFF5D9CEC);

  static const Color lightScaffoldBackGround = Color(0xFFDFECDB);
  static const Color darkScaffoldBackGround = Color(0xFF060E1E);

  static const Color lightMonthDayColor = Color(0xFF000000);
  static const Color darkMonthDayColor = Color(0xFFFFFFFF);

  static final lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    inputDecorationTheme:
        InputDecorationTheme(labelStyle: TextStyle(color: Colors.black)),
    appBarTheme: AppBarTheme(
      color: lightPrimaryColor,
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: lightPrimaryColor),
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: lightScaffoldBackGround,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // now we but a navigation appBar we need to make this transparent so the
        // appbar theme show make it not transparent to see if u forget
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: lightPrimaryColor, size: 36),
        unselectedIconTheme: IconThemeData(color: Color(0xFFC8C9CB), size: 36)),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: lightScaffoldBackGround,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)))),
    textTheme: const TextTheme(
      // the add task bar  and editTask bar
      headline5: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      headline4: TextStyle(
          color: lightPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      //app bar of Edit screen
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    appBarTheme: const AppBarTheme(color: darkPrimaryColor),
    bottomAppBarColor: Color(0xFF141922),
    scaffoldBackgroundColor: darkScaffoldBackGround,
    inputDecorationTheme:
        InputDecorationTheme(labelStyle: TextStyle(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // now we but a navigation appBar we need to make this transparent so the
        // appbar theme show make it not transparent to see if u forget
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: darkPrimaryColor, size: 36),
        unselectedIconTheme: IconThemeData(color: Color(0xFFC8C9CB), size: 36)),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF141922),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)))),
    textTheme: const TextTheme(
      // the add task bar  and editTask bar
      headline5: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      headline4: TextStyle(
          color: darkPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      //app bar of Edit screen
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
  );
}
