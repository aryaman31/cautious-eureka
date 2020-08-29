import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black38,
            child: Center(
                child: Column(
                  children: <Widget>[
                    Text("Do 50 pushups", style: TextStyle(fontSize: 40, fontFamily: "Raleway", color: Colors.white), textAlign: TextAlign.center,),

                  ],
                )
            ),
          ),
        ],
      )
    );
  }
}