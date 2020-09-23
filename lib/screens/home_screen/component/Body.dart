import 'package:flutter/material.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/screens/download_form_screen.dart';
import 'package:survey_app/screens/home_screen/component/HomeScreenCard.dart';
import 'file:///C:/flutter_project/survey_app/lib/screens/saved_surveys_screen/saved_surveys_screen.dart';
import 'package:survey_app/screens/survey_screen/SurveyScreen.dart';

class Body extends StatefulWidget {
  final String token;

  const Body({Key key, this.token}) : super(key: key);
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
                image: AssetImage("assets/images/screen/home_screen_bg.png"),
                fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 40,
          left: 120,
          right: 120,
          child: Center(
            child: Text(
              "HOME",
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          right: 10,
          height: MediaQuery.of(context).size.height - 50,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HomeScreenCard(
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DownloadFormScreen(
                                token:widget.token,
                              )));
                    },
                    icon: "assets/svg/download_form.svg",
                    title: "DownLoad Forms",
                    subtitle: "10",
                  ),
                  HomeScreenCard(
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedSurveysScreen()));
                    },
                    icon: "assets/svg/fill_form.svg",
                    title: "Fill Forms",
                    subtitle: "5",
                  ),
                  HomeScreenCard(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurveyScreen(),
                        ),
                      );
                    },
                    icon: "assets/svg/saved_response.svg",
                    title: "Saved Response",
                    subtitle: "2",
                  ),
                ],
              ),
            ),
          ),
        ),

        //  ListView.builder(itemBuilder: )
      ],
    );
  }
}
