import 'package:flutter/material.dart';
import 'timer.dart';
import 'dart:io';
import 'task_handler.dart';

class MainStuff extends StatefulWidget {
  final TasksStorage storage = TasksStorage();
//  MainStuff({Key key}) : super(key: key);

  @override
  _MainStuffState createState() => _MainStuffState();
}

class _MainStuffState extends State<MainStuff> {

  String task = "Loading Task...";

  @override
  void initState() {
    super.initState();
    widget.storage.readCompletedTasks().then((String value) {
      if (value != '0') {
        value.split(",");
        setState(() {
          task = value[value.length-1];
        });
      } else {
        setState(() {
          task = "An error occured";
        });
      }
    });
  }

  Future<File> completedTask() async {
    return widget.storage.appendToCompletedTasks("Dang");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(task, style: TextStyle(fontSize: 40, fontFamily: "Raleway", color: Colors.white), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.all(10)),
              CountDownTimer(),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: completedTask,
                    color: Colors.amber,
                    child: Text("Done!"),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  RaisedButton(
                    onPressed: () => print("Your mom is gay"),
                    color: Colors.amber,
                    child: Text("Skip"),
                  )
                ],
              )
        ],
      )),
    );
  }
}
