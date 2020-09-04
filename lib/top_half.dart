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
              CountDownTimer(),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () => print("Hello World!!"),
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
