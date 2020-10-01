import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_database/moor_database.dart';
import 'screens/home_screen/HomeScreen.dart';
import 'screens/login_screen.dart';
import 'services/change_password_services.dart';
import 'services/login_services.dart';
import 'services/response_services.dart';
import 'services/surveys_all_services_local.dart';

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
        Provider<ChangePasswordServices>(
          create: (_) => ChangePasswordServices.create(),
          dispose: (_, ChangePasswordServices services) => services.client.dispose,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Survey App',
        theme: ThemeData(
            //  primarySwatch: loginBgColor,
            ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        home:
        rememberMe==null?
            LoginScreen():
            HomeScreen(),

      ),
    );
  }
}
