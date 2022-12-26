import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/database/my_database.dart';
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
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.red
      ),

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
              color: Colors.white
          ),
          child: Row(
            children: [

              Container(
                height: 70,
                width: 6,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme
                        .of(context)
                        .primaryColor
                ),
              ),


              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(widget.task.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline4,
                      ),

                      SizedBox(height: 5,),

                      Text(widget.task.description,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline3,
                      ),


                    ],
                  ),
                ),
              ),


              Container(

                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme
                        .of(context)
                        .primaryColor
                ),
                child: Icon(Icons.done,
                  size: 27,
                  color: Colors.white,
                ),
              ),


            ],
          ),

        ),
      ),
    );
  }

  void deleteTask() {
    DialogUtils.showMessage(context,
      'are you sure you want to delete:  ' + widget.task.title,
      posActionTitle: 'Yes',
      posAction: () async {
        DialogUtils.showProgressDialog(context, 'Deleting...');
        await MyDataBase.deleteTask(widget.task);
        DialogUtils.hideDialog(context);

        DialogUtils.showMessage(context,
            'Task Deleted..',
            posActionTitle: 'Ok',
            negActionTitle: 'Undo',
            negAction: () {


            }
        );
      },
      negActionTitle: 'No',

    );
  }

}