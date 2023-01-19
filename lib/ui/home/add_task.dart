
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database/my_database.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/utils/dialogUtils.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var descController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Add New Task',
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
              style: Theme.of(context).textTheme.headline6,
              controller: titleController,
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
              style: Theme.of(context).textTheme.headline6,
              controller: descController,
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
              showTaskDatePicker();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dateFormat.format(selectedDate),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              insertTask();
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  insertTask() async{
    if (formKey.currentState?.validate() == false) {
      return ;
    }
      Task task = Task(
          title: titleController.text,
          description: descController.text,
          dateTime: selectedDate);

    DialogUtils.showProgressDialog(context , 'Loading...' , isDismissable: true );


    try{

      await MyDataBase.insertTask(task);
      titleController.text = '' ;
      descController.text = '' ;
      selectedDate = DateTime.now() ;
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, 'task saved....' ,
          posActionTitle: 'OK' ,
          posAction: (){
            Navigator.pop(context);
          },
          negActionTitle: 'Cancel');


    }catch(e){
      DialogUtils.showMessage(context, e.toString() ,
          posActionTitle: 'OK' ,
          posAction: (){
            Navigator.pop(context);
          },);
    }




  }



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
}
