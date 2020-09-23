import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/local_database/moor_database.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:survey_app/services/surveys_all_services_local.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//        Provider<SurveyServices>(
//          create: (_) => SurveyServices.create(),
//          dispose: (_, SurveyServices services) => services.client.dispose,
////        ),
//        Provider<SurveysAllServices>(
//          create: (_) => SurveysAllServices.create(),
//          dispose: (_, SurveysAllServices services) => services.client.dispose,
//        ),
        Provider<SurveysAllServicesLocal>(
          create: (_) => SurveysAllServicesLocal.create(),
          dispose: (_, SurveysAllServicesLocal services) => services.client.dispose,
        ),
        Provider<AppDatabase>(
          create: (_) => AppDatabase(),
        //  dispose: (_, AppDatabase services) => services.,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Survey App',
        theme: ThemeData(
            //  primarySwatch: loginBgColor,
            ),
        home:
            //QuestionList()
            LoginScreen(),
      ),
    );
  }
}
