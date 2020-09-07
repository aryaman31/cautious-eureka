import 'package:flutter/material.dart';
import 'top_half.dart';
import 'completed_tasks.dart';
import 'task_handler.dart';

class RootPage extends StatefulWidget {
  final TasksStorage storage = TasksStorage();
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var noCompletedTasks = 0;
  var completedTasks;

  @override
  void initState() {
    super.initState();
    widget.storage.readCompletedTasks().then((value) {
      if (value != '0') {
        setState(() {
          completedTasks = value.split(',');
          completedTasks.removeAt(0);
          noCompletedTasks = completedTasks.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            collapsedHeight: 200,
            pinned: true,
            flexibleSpace: MainStuff(),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return CompletedCard(text: completedTasks[index]);
              },
              childCount: noCompletedTasks)
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}