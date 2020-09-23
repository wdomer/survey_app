import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/screens/account_screen/components/AccountScreenCard.dart';

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
                  image: AssetImage("assets/images/screen/account_bg.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          top: 40,
          left: 120,
          right: 120,
          child: Center(
            child: Text(
              "ACCOUNT",
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 50,
          right: MediaQuery.of(context).size.width / 2 - 50,
          top: 105,
          child: Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  gradientBegin,
                  gradientend,
                ],
                begin: FractionalOffset(1.0, 1.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
              ),
            ),
            child: SvgPicture.asset(
              "assets/svg/person.svg",
              height: 50,
              width: 50,
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 200,
          height: MediaQuery.of(context).size.height - 300,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "USER NAME",
                      style: TextStyle(
                          fontSize: 22,
                          color: loginBtnColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  AccountScreenCard(
                    title: "User Name :",
                    subtitle: "Edit Your User Name",
                  ),
                  AccountScreenCard(
                    title: "Email :",
                    subtitle: "Edit Your Email",
                  ),
                  AccountScreenCard(
                    title: "Mobile Number :",
                    subtitle: "+249 1234 567 890",
                  ),
                  AccountScreenCard(
                    title: "User Name :",
                    subtitle: "Edit Your User Name",
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
