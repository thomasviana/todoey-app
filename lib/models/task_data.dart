import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';
import 'package:provider/provider.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void modifyList(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
