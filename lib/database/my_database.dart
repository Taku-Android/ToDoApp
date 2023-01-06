import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/utils/date_utils.dart';

class MyDataBase{

  static const String COLLECTION_NAME = 'tasks' ;


  static CollectionReference<Task> getTasksCollection(){
    var tasksCollection = FirebaseFirestore.instance
        .collection(COLLECTION_NAME)
        .withConverter<Task>(fromFirestore: (snapshot ,_) => Task.fromFireStore(snapshot.data()!),
        toFirestore: (task ,options) => task.toFireStore());

    return tasksCollection ;
  }


  static Future<void> insertTask(Task task){

    var tasksCollection = getTasksCollection();
    var doc = tasksCollection.doc();

    task.id = doc.id ;
    task.dateTime = task.dateTime.extractDateOnly();
    return doc.set(task);

  }



  static Future<List<Task>> getTasks(DateTime dateTime) async{

    var querySnapshot = await getTasksCollection().
    where('dateTime' , isEqualTo: DateUtils.extractDateOnly(dateTime).millisecondsSinceEpoch).get();
    var taskList = querySnapshot.docs.map((doc) => doc.data()).toList();

    return taskList ;

  }

  static Future<QuerySnapshot<Task>> getTasksFuture(DateTime dateTime){

    return getTasksCollection().
    where('dateTime' , isEqualTo: DateUtils.extractDateOnly(dateTime).millisecondsSinceEpoch).get();

  }

  static Stream<QuerySnapshot<Task>> getTasksRealTimeUpdates(DateTime dateTime){

    return getTasksCollection().
    where('dateTime' ,isEqualTo: dateTime.extractDateOnly().millisecondsSinceEpoch ).snapshots();

  }

  static Future<void> deleteTask(Task task){

    var taskDoc = getTasksCollection().doc(task.id);

    return taskDoc.delete();

  }


  static void markAsDone(Task task){

    if(task.isDone){
      task.isDone = false;
      getTasksCollection()
          .doc(task.id)
          .set(task);
    }else {
      task.isDone = true;
      getTasksCollection()
          .doc(task.id)
          .set(task);
    }
  }

  static void editTask(Task task){

      getTasksCollection()
          .doc(task.id)
          .set(task);

  }



}