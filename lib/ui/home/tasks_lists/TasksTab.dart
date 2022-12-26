import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/ui/home/tasks_lists/task_item.dart';

class TasksTab extends StatefulWidget {
  static const String routeName = 'tasks';

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  //List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {

    /**
    if (tasks.isEmpty) {
      loadTasks();
    }
     */

    var selectedDate = DateTime.now();

    return Container(
      child: Column(children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            setState(() {
              selectedDate = date ;
            });
          },
          leftMargin: 15,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Theme.of(context).primaryColor,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Theme.of(context).primaryColor,
          selectableDayPredicate: (date) => true,
          locale: 'en',

        ),

        Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
                stream: MyDataBase.getTasksRealTimeUpdates(selectedDate),
                builder: (buildContext, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error loading tasks..'));
                    // show try again btn     assignment
                  }
                  var tasks =
                      snapshot.data!.docs.map((doc) => doc.data()).toList();
                  return ListView.separated(
                    itemBuilder: (_, index) {
                      return TaskItem(tasks[index]);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 1,
                    ),
                    itemCount: tasks!.length,
                  );
                })),
      ]),
    );

    /*     another Solution
               FutureBuilder<List<Task>>(
                    future: MyDataBase.getTasks(),
                    builder: (buildContext, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator());
                      }
                      if(snapshot.hasError){
                        return Center(child: Text('Error loading tasks..'));
                        // show try again btn     assignment
                      }
                      var tasks = snapshot.data;
                      return ListView.separated(
                        itemBuilder: (_, index) {
                          return TaskItem(tasks[index]);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: tasks!.length,
                      );
                    }))

                 */
  }

/*
  Future<void> loadTasks() async {
    tasks = await MyDataBase.getTasks();

    setState(() {});
  }

   */

}
