import 'package:flutter/material.dart';

import 'top_half.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: MainStuff(),
          )
        ],
      )
    );
  }
}