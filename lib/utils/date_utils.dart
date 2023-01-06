class DateUtils{


  static DateTime extractDateOnly(DateTime dateTime){

    return DateTime(
        dateTime.year ,
      dateTime.month ,
      dateTime.day
    );

  }




}



extension DateTimeExtension on DateTime{
  DateTime extractDateOnly(){


    return DateTime(this.year , this.month , this.day);

  }
}


