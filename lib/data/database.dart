import 'package:hive/hive.dart';

class TodoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  // will run if 1st time opening app
  void createInitialData() {
    toDoList = [
      ["Make code For mobile develoopment", false],
      ["Create a video for mobile development", false],
    ];
  }

  // load data from database
  void loadData() {
    todo
  }
  //upodate database 
  void updateDatabase() {

  }
}
