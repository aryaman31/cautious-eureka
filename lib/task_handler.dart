import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class TasksStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _completedTasks async {
    final path = await _localPath;
    return File('$path/completedTasks.txt');
  }

  Future<File> get _allTasks async {
    final path = await _localPath;
    return File('$path/allTasks.txt');
  }

  Future<String> readAllTasks() async {
    try {

      final file = await _allTasks;
      String contents = await file.readAsString();
      return contents;

    } catch (e) {

      return '0';

    }
  }

  Future<String> readCompletedTasks() async {
    try {

      final file = await _completedTasks;
      String contents = await file.readAsString();
      print('test');
      return contents;

    } catch (e) {

      return '0';

    }
  }

  Future<File> appendToCompletedTasks(String newTask) async {
    final file = await _completedTasks;
    String oldContents = await readCompletedTasks();
    if (oldContents != '0') {
      String newContent = oldContents + ',$newTask';
      return file.writeAsString(newContent);
    } else {
      return file;
    }
  }
}
