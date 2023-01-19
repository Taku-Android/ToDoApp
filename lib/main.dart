

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/settings_providers.dart';
import 'package:todo_app/splash_screen.dart';
import 'package:todo_app/ui/home/home_screen.dart';
import 'package:todo_app/ui/home/settings/settings_tab.dart';
import 'package:todo_app/ui/home/tasks_lists/TasksTab.dart';
import 'package:todo_app/ui/home/tasks_lists/edit_task_screen.dart';

import 'firebase_options.dart';

void main() async {
  // init the firebase before run the app
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider() ,
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      routes: {
        Splash.routeName : (_) => Splash() ,
        HomeScreen.routeName : (_) => HomeScreen() ,
        SettingsTabs.routeName : (_) => SettingsTabs() ,
        TasksTab.routeName : (_) => TasksTab() ,
        //EditTaskScreen.routeName : (_) => EditTaskScreen() ,
      },
      initialRoute: Splash.routeName,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme ,
    );


  }
}