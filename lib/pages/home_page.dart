import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
   final _controller = TextEditingController();


  /// List of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false]
  ];

  ///checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  ///save new task''
  void saveNewTask () {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
          Navigator.of(context).pop();
  }


  //// create a new task
  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: createNewTask,
        child: Icon(Icons.add,
        color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),);
        },

      )
    );
  }
}

























////////// Learning Process //////////////////////////
///


// import 'package:flutter/material.dart';

// class ToDoPage extends StatefulWidget {
//   const ToDoPage({super.key});

//   @override
//   State<ToDoPage> createState() => _ToDoPageState();
// }

// class _ToDoPageState extends State<ToDoPage> {


//   //text editig controller to get access to what the user typed 
//   TextEditingController myController = TextEditingController();
//   // greeting message variable
//   String greetingMessage = "";

//   ////greet user method
//   void greetUser() {
//       String userName = myController.text;

//     setState(() {
//       greetingMessage= "Hello, " + userName;
//     });
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // greet user message
//               Text(greetingMessage),
//               TextField(
//                 controller: myController,
//                 decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Type your name...",
          
//                 ),
//               ),
          
          
//               ///button
//               ElevatedButton(onPressed: greetUser, child: Text('Tap')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }