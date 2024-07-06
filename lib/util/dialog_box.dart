import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,  required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Set border radius to zero
      ),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: 'Add a new task',
              ),
            ),


            /// buttons -> save -> cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              /// save Button
              MyButton(text: "Save", onpressed: onSave),

          const SizedBox(width: 8),


            //// cancel Button
             MyButton(text: "Cancel", onpressed: onCancel)

              ],
              )
          ],
          ////get the user input
        ),
      ),
    );
  }
}
