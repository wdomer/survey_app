import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_app/common/AppColors.dart';

class SettingsScreenCard extends StatelessWidget {
  final String icon;
  final String title;

  const SettingsScreenCard({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3.5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            icon,
            height: 36,
            width: 36,
            color: loginBtnColor,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //  width: MediaQuery.of(context).size.width / 1.7,
            child: Text(
              title,
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
    );
  }
}
