import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
   final String taskName;
   final bool taskCompleted;
   final Function(bool?)? onChanged;
   final Function(BuildContext) ? deleteFunction;
    ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged, required String title,
    required this.deleteFunction(BuildContext context),
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion() ,
          children: [
            SlidableAction(
             icon: Icons.delete,
              onPressed: deleteFunction,
               backgroundColor: const Color.fromARGB(137, 235, 201, 201),
               ),
          ],
          
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius:BorderRadius.circular(25)
            ),
          child: Row(
            children: [
      
              //checkbox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
      
      
      
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted 
                ? TextDecoration.lineThrough
                : TextDecoration.none ),
                ),
            ],
          ),
          
        ),
      ),
    );
  }
}