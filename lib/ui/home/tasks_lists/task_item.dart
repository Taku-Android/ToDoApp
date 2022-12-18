import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18) ,
        color: Colors.red
      ),
      child: Slidable(

        startActionPane: ActionPane(
          extentRatio: 0.2 ,
          motion: DrawerMotion() ,
          children: [
            SlidableAction(

              onPressed: (_){
                print('task deleted');
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18) ,
                bottomLeft: Radius.circular(18) ,
              ),
            ),
          ],
        ),

        child: Container(
          height: 90,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18) ,
            color: Colors.white
          ),
          child: Row(
            children: [

              Container(
                height: 70,
                width: 6,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18) ,
                  color: Theme.of(context).primaryColor
                ),
              ),


              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Task Title' ,
                        style: Theme.of(context).textTheme.headline4 ,
                      ) ,

                      SizedBox(height: 5,),

                      Text('Task description' ,
                        style: Theme.of(context).textTheme.headline3 ,
                      ) ,


                    ],
                  ),
                ),
              ),


              Container(

                padding: EdgeInsets.symmetric(vertical: 6 , horizontal: 18),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10) ,
                    color: Theme.of(context).primaryColor
                ),
                child: Icon(Icons.done ,
                  size: 27,
                  color: Colors.white,
                ),
              ),




            ],
          ),

        ),
      ),
    ) ;

  }
}