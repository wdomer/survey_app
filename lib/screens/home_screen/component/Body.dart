import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../common/AppColors.dart';
import '../../../local_database/all_surveys.dart';
import '../../../local_database/moor_database.dart';
import 'HomeScreenCard.dart';
import '../../saved_surveys_screen/saved_surveys_screen.dart';
import '../../survey_screen/SurveyScreen.dart';

import '../../../services/surveys_all_services_local.dart';

class Body extends StatefulWidget {
  final String token;

  const Body({Key key, this.token}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String token;

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

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
          left: 100,
          right: 100,
          child: Center(
            child: Text(
              "HOME",
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ).tr(),
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
                token!=null?  FutureBuilder(
                    future: Provider.of<SurveysAllServicesLocal>(context)
                        .getSurveysLocal("Bearer $token", 0),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          if (snapshot.hasError) {
                            return Container();
                          } else {
                            print(snapshot.data.body);
                            final response = snapshot.data.body;
                        var survey = AllSurveys.fromJson(response);
                        var length = survey.surveys.data.length;

                            return HomeScreenCard(
                              onClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SavedSurveysScreen()));
                              },
                              icon: "assets/svg/download_form.svg",
                              title: "DownLoad Forms".tr(),
                             // subtitle: "",
                              subtitle:length==null||length==0?'0': ("$length"),
                            );
//
//
                          }
                        }
                      }
                      return HomeScreenCard(
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SavedSurveysScreen()));
                        },
                        icon: "assets/svg/download_form.svg",
                        title: "DownLoad Forms".tr(),
                        subtitle: "",
                      );
                    },
                  ):
                  HomeScreenCard(
                    onClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedSurveysScreen()));
                    },
                    icon: "assets/svg/download_form.svg",
                    title: "DownLoad Forms".tr(),
                    subtitle: "0",
                  ),
                  FutureBuilder(
                    future: Provider.of<AppDatabase>(context).getAllSurveys(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var length = snapshot.data.length;
                        if (snapshot.hasData) {
                          if (snapshot.hasError) {
                            return Container();
                          } else {
                            return HomeScreenCard(
                              onClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SavedSurveysScreen()));
                              },
                              icon: "assets/svg/fill_form.svg",
                              title: "Fill Forms".tr(),
                              subtitle: length == null || length == 0
                                  ? '0'
                                  : ("$length"),
                            );
//
//
                          }
                        }
                      }
                      return HomeScreenCard(
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SavedSurveysScreen()));
                        },
                        icon: "assets/svg/fill_form.svg",
                        title: "Fill Forms".tr(),
                        subtitle: "0",
                      );
                    },
                  ),
                  FutureBuilder(
                    future: Provider.of<AppDatabase>(context).getAllResult(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var length = snapshot.data.length;
                        if (snapshot.hasData) {
                          if (snapshot.hasError) {
                            return Container();
                          } else {
                            return HomeScreenCard(
                              onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SurveyScreen(),
                                  ),
                                );
                              },
                              icon: "assets/svg/saved_response.svg",
                              title: "Saved Response".tr(),
                              subtitle: length == null || length == 0
                                  ? '0'
                                  : ("$length"),
                            );
//
//
                          }
                        }
                      }
                      return HomeScreenCard(
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SurveyScreen(),
                            ),
                          );
                        },
                        icon: "assets/svg/saved_response.svg",
                        title: "Saved Response".tr(),
                        subtitle: "0",
                      );
                    },
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
