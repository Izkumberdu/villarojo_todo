import 'package:flutter/material.dart';
import 'package:villarojo_todo/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false]
  ];

  void checkBoxChanged(bool value, int index){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef292),
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: toDoList.length, itemBuilder: (context, index) {
            return ToDoTile(taskName: toDoList[index][0], onChanged: (value) => checkBoxChanged , taskCompleted: toDoList[index][1])
          }),
    );
  }
}
