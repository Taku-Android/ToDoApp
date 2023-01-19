import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/ui/home/tasks_lists/edit_task_screen.dart';
import 'package:todo_app/utils/dialogUtils.dart';

import '../../../database/task.dart';

class TaskItem extends StatefulWidget {
  Task task;

  TaskItem(this.task);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
/*
        Navigator.of(context).pushNamed(EditTaskScreen.routeName ,
        arguments: widget.task
        );


 */

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditTaskScreen(widget.task)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.red),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.2,
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  deleteTask();
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              ),
            ],
          ),
          child: Container(

            height: 90,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).bottomAppBarColor),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: widget.task.isDone
                          ? Color(0xFF61E757)
                          : Theme.of(context).primaryColor),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.task.title,
                            style: widget.task.isDone
                                ? Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.apply(color: Color(0xFF61E757))
                                : Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.task.description,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    MyDataBase.markAsDone(widget.task);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.task.isDone
                            ? Theme.of(context).bottomAppBarColor
                            : Theme.of(context).primaryColor),
                    child: widget.task.isDone
                        ? Text(
                            'Done!',
                            style: TextStyle(
                                fontSize: 22 , color: Color(0xFF61E757)),
                          )
                        : Icon(
                            Icons.done,
                            size: 27,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    DialogUtils.showMessage(
      context,
      'are you sure you want to delete:  ' + widget.task.title,
      posActionTitle: 'Yes',
      posAction: () async {
        DialogUtils.showProgressDialog(context, 'Deleting...');
        await MyDataBase.deleteTask(widget.task);
        DialogUtils.hideDialog(context);

        DialogUtils.showMessage(context, 'Task Deleted..',
            posActionTitle: 'Ok', negActionTitle: 'Undo', negAction: () {});
      },
      negActionTitle: 'No',
    );
  }
}
