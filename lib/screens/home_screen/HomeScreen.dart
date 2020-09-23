import 'package:flutter/material.dart';
import 'package:survey_app/screens/home_screen/component/Body.dart';
import 'package:survey_app/widget/BottomBar.dart';
import 'package:survey_app/widget/DrawerWidget.dart';

class HomeSceen extends StatefulWidget {
  @override
  _HomeSceenState createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Body(),
        ),
        bottomNavigationBar: BottomBar());
  }
}
