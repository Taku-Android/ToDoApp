

import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/ui/home/tasks_lists/task_item.dart';

class TasksTab extends StatelessWidget{

  static const String routeName = 'tasks';

  @override
  Widget build(BuildContext context) {



    return Column(
          children: [

            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date) ,
              leftMargin: 20,
              shrink: true,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: Theme.of(context).primaryColor,
              activeBackgroundDayColor: Colors.white,
              dotsColor: Theme.of(context).primaryColor ,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),


            Expanded(
              child: ListView.separated(itemBuilder: (_,index){

                return TaskItem() ;

              },
                separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
                itemCount: 10 , ),
            )



          ],

    );
  }
}