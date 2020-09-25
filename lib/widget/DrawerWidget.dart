import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/screens/account_screen/AccountScreen.dart';
import 'package:survey_app/screens/home_screen/HomeScreen.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:survey_app/screens/settings_screen/SettingsScreen.dart';
import 'package:survey_app/screens/survey_screen/SurveyScreen.dart';
import 'package:easy_localization/easy_localization.dart';

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
                      DrawerList(
                        title: "Home".tr() ,
                        icon: "home.svg",
                        tapped: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
                      ),

                      DrawerList(
                        title: "Account".tr() ,
                        icon: "person.svg",
                        tapped: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AccountScreen())),
                      ),
                      DrawerList(
                        title: "Surveys" ,
                        icon: "folder.svg",
                        tapped: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SurveyScreen())),
                      ),
                      DrawerList(
                        title: "Notifications" ,
                        icon: "notifications.svg" ,
                     //   tapped: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Notification())),
                      ),
                      DrawerList(
                        title: "Settings" ,
                        icon: "settings.svg",
                        tapped: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsScreen())),
                      ),
                      DrawerList(
                        title: "Logout" ,
                        icon: "logout.svg",
                        tapped: ()async{
                          SharedPreferences share =
                          await SharedPreferences

                              .getInstance();
                          share.clear();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>
                                  LoginScreen()));
                          },
                      ),

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
        ).tr()
      ],
    );
  }
}

class DrawerList extends StatelessWidget {
  final Function tapped;
  final String icon;
  final String title;

  const DrawerList({Key key, this.tapped, this.icon, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
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
      ),
    );
  }
}

