

import 'package:flutter/material.dart';

class MyTheme {

  static const Color lightPrimaryColor = Color(0xFF5D9CEC);

  static const Color lightScaffoldBackGround = Color(0xFFDFECDB);






  static final lightTheme = ThemeData(

    primaryColor: lightPrimaryColor ,

    appBarTheme: const AppBarTheme(
      color: lightPrimaryColor
    ),

    scaffoldBackgroundColor: lightScaffoldBackGround ,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // now we but a navigation appBar we need to make this transparent so the
      // appbar theme show make it not transparent to see if u forget
        backgroundColor: Colors.transparent ,
        elevation: 0,
      selectedIconTheme: IconThemeData(
        color: lightPrimaryColor ,
        size: 36

      ) ,
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC8C9CB) ,
        size: 36
      )
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white ,

        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20) ,
          topRight: Radius.circular(20)

        )
      )

    ),



    textTheme: const TextTheme(
      // the add task bar  and editTask bar
      headline5: TextStyle(
        color: Colors.black ,
        fontSize: 20 ,
        fontWeight: FontWeight.bold
      ) ,
      headline6: TextStyle(
          color: Colors.black ,
          fontSize: 18 ,
          fontWeight: FontWeight.bold
      ) ,
      headline4: TextStyle(
          color: lightPrimaryColor ,
          fontSize: 20 ,
          fontWeight: FontWeight.bold

      ) ,
      headline3: TextStyle(
          color: Colors.black ,
          fontSize: 14 ,

      ) ,
      //app bar of Edit screen
      headline2: TextStyle(
        color: Colors.white ,
        fontSize: 24 ,

      ) ,

    ),



  );



}