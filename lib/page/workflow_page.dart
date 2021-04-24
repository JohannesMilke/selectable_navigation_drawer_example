import 'package:flutter/material.dart';
import 'package:selectable_navigation_drawer_example/widget/navigation_drawer_widget.dart';

class WorkflowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Workflow'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      );
}
