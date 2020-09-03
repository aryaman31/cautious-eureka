import 'package:flutter/material.dart';
import 'timer.dart';

class MainStuff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Do 50 pushups", style: TextStyle(fontSize: 40, fontFamily: "Raleway", color: Colors.white), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.all(10)),
              CountDownTimer()
        ],
      )),
    );
  }
}
