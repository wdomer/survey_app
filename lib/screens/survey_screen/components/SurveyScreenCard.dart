import 'package:flutter/material.dart';

class SurveyScreenCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const SurveyScreenCard({Key key, this.icon, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xff014a71),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Created on  ",
                      style: TextStyle(color: Color(0xff7bccf2), fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: subtitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff014a71),
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
