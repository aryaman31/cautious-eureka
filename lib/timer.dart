import 'package:flutter/material.dart';

//class CountDownTimer extends StatefulWidget {
//  @override
//  _CountDownTimerState createState() => _CountDownTimerState();
//}
//
//class _CountDownTimerState extends State<CountDownTimer> {
//
//}

class CountDownTimer extends StatelessWidget {

  final radius = 8.0;
  var animationLength;
  var secondsLeft;
  var secondsInDay = 86400;

  CountDownTimer() {
    var hours = 23 - DateTime.now().hour;
    var minutes = 59 - DateTime.now().minute;
    var seconds = 59 - DateTime.now().second;
    secondsLeft = (hours * 3600) + (minutes * 60) + seconds;
    animationLength = Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(radius))),
      height: 30,
      alignment: Alignment(1.0, 0.0),
      width: MediaQuery.of(context).size.width - 50,
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: secondsLeft/secondsInDay, end: 0),
          duration: animationLength,
          builder: (BuildContext context, double x, Widget child) {
            return Container(
              width: x * (MediaQuery.of(context).size.width),
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(radius))),
            );
          }
      )
    );
  }
}