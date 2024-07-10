import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabse db = ToDoDatabse();

  @override
  void initState() {
    // if this is th first time loading the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }


  //text controller
   final _controller = TextEditingController();

  ///checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  ///save new task''
  void saveNewTask () {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
     Navigator.of(context).pop();
    db.updateDataBase();
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

///////// delete a task
void deleteTask(int index) {
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            
            );
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