import 'package:flutter/material.dart';
import 'timer.dart';
import 'dart:math';
import 'task_handler.dart';

class MainStuff extends StatefulWidget {
  final TasksStorage storage = TasksStorage();
//  MainStuff({Key key}) : super(key: key);

  @override
  _MainStuffState createState() => _MainStuffState();
}

class _MainStuffState extends State<MainStuff> {

  String task;

  @override
  void initState() {
    super.initState();
    widget.storage.allTasksExists().then((value) {
      if (!value) {
        String x = "Do 50 push ups, Draw something, Watch a movie, Eat a sandwhich";
        widget.storage.writeToAllTasks(x).then((value) => print("allTasks.txt created"));
      }

      widget.storage.completedTasksExists().then((value){
        if (!value) {
          String x = "Hmm I see you snooping :)";
          widget.storage.writeToCompletedTasks(x).then((value) => print("completedTasks.txt created"));
        }
      });

      selectNewTask();

//      widget.storage.readCompletedTasks().then((String value) {
//        if (value != '0') {
//          var arr = value.split(', ');
//          setState(() {
//            task = arr[arr.length-1];
//          });
//        } else {
//          setState(() {
//            task = "An error occured";
//          });
//        }
//      });

    });
  }

  void onCompleted(String task) {
    if (task != "An error occured") {
      widget.storage.readCompletedTasks().then((value) {
        if (value != '0') {
          if (task != "All tasks completed") {
            widget.storage.writeToCompletedTasks(value + ", $task");
            selectNewTask();
          }
        }
      });
    }
  }

  void selectNewTask() {
    widget.storage.readAllTasks().then((value1) {
      if (value1 != '0') {
        widget.storage.readCompletedTasks().then((value2) {
          if (value2 != '0') {
            final _random = Random();
            print(value1);
            var _arr1 = value1.split(', ');
            print(_arr1);
            var _arr2 = value2.split(', ');
            var _newTask = _arr1[_random.nextInt(_arr1.length)];
            bool temp = true;
            while (_arr2.contains(_newTask) && temp) {
              _arr1.remove(_newTask);
              if (_arr1.length != 0) {
                _newTask = _arr1[_random.nextInt(_arr1.length)];
              } else {
                temp = false;
                _newTask = "All tasks completed";
              }
            }
            setState(() {
              task = _newTask;
            });
          }
        });
      }
    });
  }

  void reset() {
    widget.storage.resetCompletedTasks().then((value1) {
      widget.storage.readCompletedTasks().then((String value) {
        if (value != '0') {
          var arr = value.split(', ');
          setState(() {
            task = arr[arr.length - 1];
          });
        } else {
          setState(() {
            task = "An error occured";
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(task ?? "Loading task...", style: TextStyle(fontSize: 40, fontFamily: "Raleway", color: Colors.white), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.all(10)),
              CountDownTimer(),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () => onCompleted(task),
                    color: Colors.amber,
                    child: Text("Done!"),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  RaisedButton(
                    onPressed: () => print("Your mom is gay"),
                    color: Colors.amber,
                    child: Text("Skip"),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  RaisedButton(
                    onPressed: reset,
                    color: Colors.amber,
                    child: Text("Reset"),
                  )
                ],
              )
        ],
      )),
    );
  }
}
