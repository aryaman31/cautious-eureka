import 'package:flutter/material.dart';

import 'top_half.dart';
import 'completed_tasks.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            collapsedHeight: 250,
            pinned: true,
            flexibleSpace: MainStuff(),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
                CompletedCard(text: "Task Goes here",),
              ])
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}