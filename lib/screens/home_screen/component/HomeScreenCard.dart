import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survey_app/common/AppColors.dart';

class HomeScreenCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Function onClick;

  const HomeScreenCard({Key key, this.icon, this.title, this.subtitle, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onClick,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
                  icon,
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        subtitle,
                        style: TextStyle(

                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: unselectedItemColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
