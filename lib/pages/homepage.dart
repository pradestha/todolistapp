import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/pages/todotile.dart';

import 'data/database.dart';
import 'dialog_box.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required String title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage > {
  //reference to the hive box
  //final _myBox = Hive.openBox ("Mybox");

 // final _mybox = Hive.openBox("Mybox");
  ToDoDataBase db = ToDoDataBase();

  //If someone is using the app 1st time
  


  //text controller
  final _controller = TextEditingController();

  
    void checkBoxChanged(bool? value, int index){
      setState(() {
        db.toDOList[index][1] = !db.toDOList[index][1];
      });
    }

    //save new task
    void saveNewTask(){
      setState(() {
        db.toDOList.add([_controller.text,false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
    }

    //create a new task
    void createNewTask(){
      showDialog(context: context, builder: (context){
        return  DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask
          );
      });
      
    }

    //delete task
    void deleteTask(int index){
      setState(() {
        db.toDOList.removeAt(index);
      });

    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 200, 244),
      appBar: AppBar(
        title: const Text('TODOX'),
        elevation : 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child:  Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: db.toDOList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            title: "TODOX",
            taskName: db.toDOList[index][0] ,
            taskCompleted: db.toDOList[index][1],
            onChanged: (value) => checkBoxChanged(value, index) ,
            deleteFunction: (context) => deleteTask,
            );
        },

        ),
    );
  }
}