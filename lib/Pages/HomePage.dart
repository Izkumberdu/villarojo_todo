import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:villarojo_todo/Functions/dialog_box.dart';
import 'package:villarojo_todo/Functions/todo_tile.dart';
import 'package:villarojo_todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  TodoDataBase db = TodoDataBase();
  final _myBox = Hive.box('mybox');

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef292),
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              onChanged: (value) => checkBoxChanged(value, index),
              taskCompleted: db.toDoList[index][1],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
