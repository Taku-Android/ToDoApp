import 'package:flutter/material.dart';

import '../../../database/task.dart';

class EditTaskSheet extends StatelessWidget{

  Task task;

  EditTaskSheet(this.task);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var formKey = GlobalKey<FormState>();

    var titleController = TextEditingController();
    var descController = TextEditingController();


    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Edit Task',
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
              controller: titleController,
              initialValue: task.title,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Please enter a valid title';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Task Title',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: TextFormField(
              controller: descController,
              initialValue: task.description,
              validator: (input) {
                if (input == null || input.isEmpty) {
                  input == "-------";
                }

                return null;
              },
              minLines: 3,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Task description',
              ),
            ),
          ),
          Text(
            'Select time',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              //showTaskDatePicker();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                //dateFormat.format(selectedDate),
                'date' ,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            //  insertTask();
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  /*
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  var selectedDate = DateTime.now();

  void showTaskDatePicker() async {
    var userSelectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (userSelectedDate == null) {
      return;
    }


    setState(() {

      selectedDate = userSelectedDate;

    });
      }

   */
}