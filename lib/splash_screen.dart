// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/settings_providers.dart';

import 'package:todo_app/ui/home/home_screen.dart';

class Splash extends StatefulWidget {

  static const String routeName = 'splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {

    var settingProvider = Provider.of<SettingsProvider>(context);

    Timer(const Duration(seconds: 2) , (){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });

    return Stack(
      children: [

        Container(
          color: Colors.white,
          child: Image.asset((settingProvider.currentTheme == ThemeMode.dark)?
          "assets/images/dark_splash.png" :
          "assets/images/ligh_splash.png"
            ,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ) ,


      ],
    );

  }
}
