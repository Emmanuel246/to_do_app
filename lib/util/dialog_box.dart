import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

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
          children: [
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: 'Add a new task',
              ),
            ),


            /// buttons -> save -> cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              /// save Button
              MyButton(text: "Save", onpressed: () {}),

            //// cancel Button
             MyButton(text: "Cancel", onpressed: () {})

              ],
              )
          ],
          ////get the user input
        ),
      ),
    );
  }
}
