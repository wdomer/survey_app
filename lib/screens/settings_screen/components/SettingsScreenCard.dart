import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/AppColors.dart';

class SettingsScreenCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function tapped;

  const SettingsScreenCard({Key key, this.icon, this.title, this.tapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
        height: MediaQuery.of(context).size.width / 4,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              icon,
//              height: 36,
//              width: 36,
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
      ),
    );
  }
}
