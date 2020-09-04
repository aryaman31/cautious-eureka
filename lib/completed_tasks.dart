import 'package:flutter/material.dart';

class CompletedCard extends StatelessWidget {

  final text;

  CompletedCard({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text(text, style: TextStyle(fontFamily: 'Raleway', fontSize: 25.0),)),
        ),
      ),
    );
  }

}