import 'package:flutter/material.dart';
import 'package:survey_app/widget/BottomBar.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          centerTitle: true,
          title: Text("Notifications"),
        ),
        bottomSheet: BottomBar(),

      ),
    );
  }
}
