import 'package:flutter/material.dart';
import 'package:survey_app/screens/account_screen//components/Body.dart';
import 'package:survey_app/widget/BottomBar.dart';
import 'package:survey_app/widget/DrawerWidget.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Body(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
