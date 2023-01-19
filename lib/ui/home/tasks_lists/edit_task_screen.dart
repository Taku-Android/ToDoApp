import 'package:flutter/material.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/utils/date_utils.dart';

import '../../../database/task.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = 'Edit';

  Task task;

  EditTaskScreen(this.task);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    //var tasks = ModalRoute.of(context)!.settings.arguments as Task;

    final formKey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: false,
        title: Text('Edit Task'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: mediaQuery.height * 0.1,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Center(
              child: Container(
                width: mediaQuery.width * 0.8,
                height: mediaQuery.height * 0.8,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).bottomAppBarColor),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        'Edit Task',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Form(

                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: TextFormField(
                                style: Theme.of(context).textTheme.headline6,
                                //controller: titleController,
                                initialValue: widget.task.title,
                                onChanged: (value) {
                                  widget.task.title = value;
                                },

                                decoration: const InputDecoration(
                                  labelText: 'Task Title',
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: TextFormField(
                                style: Theme.of(context).textTheme.headline6,
                                //controller: descController,
                                initialValue: widget.task.description,
                                onChanged: (value) {
                                  widget.task.description = value;
                                },
                                minLines: 3,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  labelText: 'Task description',
                                ),
                              ),
                            ),
                            Text(
                              'Select DateTime',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 15),
                            InkWell(
                              onTap: () {
                                // show datePicker
                                showTaskDatePicker();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.task.dateTime.year } - "
                                      "${widget.task.dateTime.month } - "
                                      "${widget.task.dateTime.day }",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                                onPressed: () {
                                  MyDataBase.editTask(widget.task);
                                  Navigator.pop(context);
                                },
                                minWidth: 235,
                                height: 55,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  'Save Changed',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showTaskDatePicker() async {
    var userSelectedDate = await showDatePicker(
        context: context,
        initialDate: widget.task.dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (userSelectedDate == null) {
      return;
    }

    setState(() {
      widget.task.dateTime = userSelectedDate;
    });
  }
}
