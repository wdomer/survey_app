import 'package:flutter/material.dart';
import 'components/Body.dart';
import '../../widget/BottomBar.dart';
import '../../widget/DrawerWidget.dart';

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
