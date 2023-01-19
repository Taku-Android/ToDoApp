import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/settings_providers.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.all(12),
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.light);
              },
              child: (settingsProvider.currentTheme == ThemeMode.light)
                  ? getSelectedItem("Light")
                  : getUnSelectedItem("Light")),
          SizedBox(
            height: 5,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.dark);
              },
              child: (settingsProvider.currentTheme == ThemeMode.dark)
                  ? getSelectedItem("Dark")
                  : getUnSelectedItem("Dark")),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(fontSize: 30, color: Colors.yellow),
    );
  }

  Widget getUnSelectedItem(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5!.copyWith(
            fontSize: 30,
          ),
    );
  }
}
