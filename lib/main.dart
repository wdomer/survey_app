import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_app/local_database/moor_database.dart';
import 'package:survey_app/screens/home_screen/HomeScreen.dart';
import 'package:survey_app/screens/login_screen.dart';
import 'package:survey_app/services/login_services.dart';
import 'package:survey_app/services/response_services.dart';
import 'package:survey_app/services/surveys_all_services_local.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();

SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
String rememberMe = sharedPreferences.getString('rememberMe');
  runApp(

  EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
    path: 'resources/langs',
    child: MyApp(
      rememberMe: rememberMe,
    ),
  ),
  );
}

class MyApp extends StatelessWidget {
  final String rememberMe;

  const MyApp({Key key, this.rememberMe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ResponseServices>(
          create: (_) => ResponseServices.create(),
          dispose: (_, ResponseServices services) => services.client.dispose,
       ),
        Provider<LoginServices>(
          create: (_) => LoginServices.create(),
          dispose: (_, LoginServices services) => services.client.dispose,
        ),
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
        rememberMe==null?
            LoginScreen():
            HomeScreen(),

      ),
    );
  }
}
