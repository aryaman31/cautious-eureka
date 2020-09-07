import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

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
      return contents;

    } catch (e) {

      return '0';

    }
  }

  Future<File> writeToCompletedTasks(String newTask) async {
    final file = await _completedTasks;
    return file.writeAsString(newTask);
  }

  Future<File> writeToAllTasks(String newTask) async {
    final file = await _allTasks;
    return file.writeAsString(newTask);
  }

  Future<bool> completedTasksExists() async {
    final file = await _completedTasks;
    return file.exists();
  }

  Future<bool> allTasksExists() async {
    final file = await _allTasks;
    return file.exists();
  }

  Future<File> resetCompletedTasks() async {
    return writeToCompletedTasks("Hmm I see you snooping :)");
  }
}
