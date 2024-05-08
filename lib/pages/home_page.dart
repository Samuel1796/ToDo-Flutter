import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tuts/data/database.dart';
import 'package:tuts/utils/dialog_box.dart';
import 'package:tuts/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // reference the hive box
  final _mybox = Hive.box("mybox");

  @override
  void initState() {
    // if this is the first time ever opening the appp
    if (_mybox.get("TODOS") == null) {
      db.createInitialData();
    } else {
      // already exists a data
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();

//Checkbox changed method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todos[index][1] = !db.todos[index][1];
    });
    db.updateData();
  }

// save new task
  void saveNewtodo() {
    setState(() {
      db.todos.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateData();
  }

// create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            controller: _controller,
            onSave: saveNewtodo,
            onCancel: () => {Navigator.of(context).pop()},
          );
        });
  }

//delete Task
  void deleteTask(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
              child: Text("TO DO",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
          elevation: 4,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.teal[100],
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.todos.length,
            itemBuilder: (context, index) {
              return TodoTile(
                task: db.todos[index][0],
                completed: db.todos[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteTodo: (context) => deleteTask(index),
              );
            })
        //  ListView(
        //   children: [

        //   ],
        // ),
        );
  }
}
