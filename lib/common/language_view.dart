import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageView extends StatefulWidget {

  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  Widget build(BuildContext context) {
    //Locale locale;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 26),
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                "Choose language",
                style: TextStyle(
                  color: Colors.blue,
                  //  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            buildSwitchListTileMenuItem(
                context: context,
                title: "عربي",
                subtitle: "عربي",
                locale: EasyLocalization.of(context).supportedLocales[1]),
            buildDivider(),
            buildSwitchListTileMenuItem(
                context: context,
                title: "English",
                subtitle: "English",
                locale: EasyLocalization.of(context).supportedLocales[0]),
            buildDivider(),

          ],
        ),
      ),
    );
  }

  Container buildDivider() => Container(
    margin: EdgeInsets.symmetric(
      horizontal: 24,
    ),
    child: Divider(
      color: Colors.grey,
    ),
  );

  Container buildSwitchListTileMenuItem(
      {BuildContext context, String title, String subtitle, Locale locale}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
          ),
          subtitle: Text(
            subtitle,
          ),
          onTap: () async {
            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            if(locale== EasyLocalization.of(context).supportedLocales[1]){
              sharedPreferences.setString('arabic', 'arabic');
              sharedPreferences.remove('english');
              print(locale);
              print(1);
            }
            if(locale== EasyLocalization.of(context).supportedLocales[0]){
              sharedPreferences.setString('english', 'english');
              sharedPreferences.remove('arabic');
              print(locale);
              print(0);
            }
            log(locale.toString(), name: this.toString());
            EasyLocalization.of(context).locale = locale;

          }),
    );
  }
}