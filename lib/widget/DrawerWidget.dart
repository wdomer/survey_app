import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_app/common/AppColors.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/screen/drawer_bg.png"),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                      ),
                      _builtNavList(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      _builtDrawerList("home.svg", "Home"),
                      _builtDrawerList("person.svg", "Account"),
                      _builtDrawerList("folder.svg", "Surveys"),
                      _builtDrawerList("notifications.svg", "Notifications"),
                      _builtDrawerList("settings.svg", "Settings"),
                      _builtDrawerList("logout.svg", "Logout"),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            icon: Image.asset(
                              "assets/icons/facebook_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Image.asset(
                              "assets/icons/tweeter_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Image.asset(
                              "assets/icons/inst_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builtDrawerList(String icon, title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          SvgPicture.asset(
            "assets/svg/$icon",
            color: white,
            height: 32,
            width: 32,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
          )
        ],
      ),
    );
  }

  Widget _builtNavList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          "assets/svg/person.svg",
          color: loginBtnColor,
          height: 70,
          width: 70,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "User Name",
          style: TextStyle(
              color: white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        )
      ],
    );
  }
}
