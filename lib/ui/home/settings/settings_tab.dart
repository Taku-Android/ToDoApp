import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/settings_providers.dart';
import 'package:todo_app/ui/home/settings/theme_bottom_sheet.dart';

class SettingsTabs extends StatefulWidget{

  static const String routeName = 'setting';

  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
  @override
  Widget build(BuildContext context) {

    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(

      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30 , horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Theme' ,
              style: Theme.of(context).textTheme.headline5,),

            SizedBox(height: 5,),
            InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                    border: Border.all(color:
                    Theme.of(context).accentColor ,
                        width: 1
                    )
                ),
                child: Text(settingsProvider.isDarkMode()? "Dark" : "Light" ,
                  style: Theme.of(context).textTheme.headline4 ,),
              ),
            )
          ],

        ),
      ),


    );
  }

  void showThemeBottomSheet() {

    showModalBottomSheet(context: context,
        builder: (buildContext){

              return ThemeBottomSheet();

        });

  }
}