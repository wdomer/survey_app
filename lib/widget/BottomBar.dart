import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/screens/account_screen//AccountScreen.dart';
import 'package:survey_app/screens/home_screen/HomeScreen.dart';
import 'package:survey_app/screens/settings_screen/SettingsScreen.dart';
import 'package:survey_app/screens/survey_screen/SurveyScreen.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static int _selectedIndex = 0;

  List<String> items = [
    "assets/svg/home.svg",
    "assets/svg/person.svg",
    "assets/svg/folder.svg",
    "assets/svg/notifications.svg",
    "assets/svg/settings.svg",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeSceen()));
    }
    if (_selectedIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AccountScreen()));
    }
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SurveyScreen()));
    }
    if (_selectedIndex == 3) {}
    if (_selectedIndex == 4) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SettingsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      elevation: 6,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //    shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (c, i) {
              return _builtItem(i, items[i]);
            }),
      ),
    );
  }

  Widget _builtItem(int index, String svg) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            //  top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            bottom: BorderSide(
                width: 3.0,
                color: index == _selectedIndex ? loginBtnColor : white),
          ),
        ),
        child: SvgPicture.asset(
          svg,
          color:
              index == _selectedIndex ? selectedItemColor : unselectedItemColor,
        ),
      ),
    );
  }
}
