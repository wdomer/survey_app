import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:survey_app/screens/settings_screen/components/SettingsScreenCard.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/screen/settings_bg.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          top: 40,
          left: 120,
          right: 120,
          child: Center(
            child: Text(
              "SETTINGS",
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
        ),
        Positioned(
          top: 160,
          left: 10,
          right: 10,
          height: MediaQuery.of(context).size.height - 270,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SettingsScreenCard(
                      icon: "assets/svg/person.svg",
                      title: "Profile",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SettingsScreenCard(
                      icon: "assets/svg/notifications.svg",
                      title: "Notifications",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SettingsScreenCard(
                      icon: "assets/svg/password.svg",
                      title: "Password",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SettingsScreenCard(
                      icon: "assets/svg/help.svg",
                      title: "Help &\nSupport",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SettingsScreenCard(
                      icon: "assets/svg/language.svg",
                      title: "Language",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SettingsScreenCard(
                      icon: "assets/svg/help.svg",
                      title: "About",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                _logoutWidget()
              ],
            ),
          ),
        ),

        //  ListView.builder(itemBuilder: )
      ],
    );
  }

  Widget _logoutWidget() {
    return InkWell(
      onTap: ()async{
        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        sharedPreferences.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 5,
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              "assets/svg/logout.svg",
              height: 36,
              width: 36,
              color: loginBtnColor,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              //  width: MediaQuery.of(context).size.width / 1.7,
              child: Text(
                "LogOut",
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  // letterSpacing: 1,
                  color: unselectedItemColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
