import 'package:flutter/material.dart';

class AddTask extends StatefulWidget{
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children:  [

          const SizedBox(height: 20,) ,

          Text('Add New Task',
            style:  Theme.of(context).textTheme.headline5,

          ) ,


          Container(
            margin: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Task Title',
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 20 , right: 20 , bottom: 20),
            child: const TextField(
              minLines: 3,
              maxLines: 3 ,
              decoration: InputDecoration(
                labelText: 'Task description',
              ),
            ),
          ),

          Text('Select time' ,
            style:  Theme.of(context).textTheme.headline6,

          ) ,

          const SizedBox(height: 30) ,

           InkWell(
             onTap: (){
               showTaskDatePicker();
             },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('20/20/2022' ,
                 style:  Theme.of(context).textTheme.headline6?.copyWith(
                     color: Theme.of(context).primaryColor ) ,

               ),
             ),
           ) ,

          ElevatedButton(onPressed: (){

          }, child: Text('Submit'),)

        ],
      ),
    );

  }

  void showTaskDatePicker(){

    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 30))) ;

  }
}