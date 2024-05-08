import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todos = [];
  //reference the box
  final _mybox = Hive.box('mybox');

//FIRST TIME EVER OPENING THE APP
  void createInitialData() {
    todos = [
      ["Watch tuts", false],
      ["Do Exercise ", false]
    ];
  }

  //LOAD THE DATA FROM THE DATABASE
  void loadData() {
    todos = _mybox.get("TODOS");
  }

//UPDATE THE DATABASE
  void updateData() {
    _mybox.put("TODOS", todos);
  }
}
