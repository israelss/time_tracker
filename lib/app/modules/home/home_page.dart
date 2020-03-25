import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_tracker/app/modules/home/components/bottom_bar/bottom_bar_widget.dart';
import 'package:time_tracker/app/modules/home/components/tracked_event_list/tracked_event_list_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title = "Time Tracker"});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          FlatButton(
            color: Colors.green,
            onPressed: () => Get.toNamed('/topicsList'),
            child: 'Tópicos'.text.size(15).wide.make(),
          )
        ],
      ),
      body: TrackedEventListWidget(),
      bottomNavigationBar: BottomBarWidget(),
      floatingActionButton: StartFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
