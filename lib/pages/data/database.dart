import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDOList = [];

  //Reference the box
  final _myBox = Hive.box("Mybox");
  //will run when the app is opened for the 1st time
  void createInitialData() {
     toDOList = [
      ["Bake a Cake", false],
      ["Buy Flowers", false],
     ];
  }

  //load data from database
  void loadData(){
     toDOList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDOList);
  }
}