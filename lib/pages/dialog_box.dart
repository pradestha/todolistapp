import 'package:flutter/material.dart';
import 'package:to_do_list_app/pages/mybuttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
     required this.onCancel,
     }) ; // Fix the constructor syntax

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white70,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              MyButtons(text: "Save", onPressed: onSave),
              MyButtons(text: "Cancel", onPressed: onCancel),
              const SizedBox(width: 8,)
            ],)
          ],
        ),

      ),
    );
  }
}
