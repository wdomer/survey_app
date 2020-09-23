import 'package:flutter/material.dart';
import 'package:survey_app/screens/settings_screen/components/Body.dart';
import 'package:survey_app/widget/BottomBar.dart';
import 'package:survey_app/widget/DrawerWidget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

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
