

import 'package:flutter/material.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/ui/home/home_screen.dart';
import 'package:todo_app/ui/home/settings/settings_tab.dart';
import 'package:todo_app/ui/home/tasks_lists/TasksTab.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        HomeScreen.routeName : (_) => HomeScreen() ,
        SettingsTabs.routeName : (_) => SettingsTabs() ,
        TasksTab.routeName : (_) => TasksTab() ,
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );


  }
}