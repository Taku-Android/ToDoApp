import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/add_task.dart';
import 'package:todo_app/ui/home/settings/settings_tab.dart';
import 'package:todo_app/ui/home/tasks_lists/TasksTab.dart';

class HomeScreen extends StatefulWidget{

  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false ,
      appBar: AppBar(
        title: const Text('To Do List' , style: TextStyle(
          color: Colors.white
        ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white , width: 4)
        ),
        onPressed: (){
            showAddTaskBottomSheet();

        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(

        shape: const CircularNotchedRectangle(),
        notchMargin: 7,

        child: BottomNavigationBar(

          currentIndex: selectedIndex,
          onTap: (index){
            setState(() {
              selectedIndex = index ;

            });
            },

          items: const [

            BottomNavigationBarItem(icon: Icon(Icons.list) , label: '') ,
            BottomNavigationBarItem(icon: Icon(Icons.settings) , label: '') ,


          ],

        ),
      ),


      body: Tabs[selectedIndex] ,

    );
  }

  var Tabs = [
    TasksTab() , SettingsTabs()
  ];


  void showAddTaskBottomSheet(){

    showModalBottomSheet(context: context, builder: (buildContext){

        return AddTask();

    });

  }


}