import 'package:flutter/material.dart';
import 'package:survey_app/screens/survey_screen/components/Body.dart';
import 'package:survey_app/widget/BottomBar.dart';
import 'package:survey_app/widget/DrawerWidget.dart';

class SurveyScreen extends StatelessWidget {
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
