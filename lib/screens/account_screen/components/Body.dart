import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:survey_app/common/AppColors.dart';
import 'AccountScreenCard.dart';

class Body extends StatefulWidget {
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
                  image: AssetImage("assets/images/screen/account_bg.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          top: 40,
          left: 120,
          right: 120,
          child: Center(
            child: Text(
              "ACCOUNT",
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ).tr(),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 50,
          right: MediaQuery.of(context).size.width / 2 - 50,
          top: 105,
          child: InkWell(
            onTap: () async {
              _asyncGetPhoto(context);
            },
            child: Container(
              height: 80,
              width: 80,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
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
                "assets/svg/person.svg",
                height: 50,
                width: 50,
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 200,
          height: MediaQuery.of(context).size.height - 300,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "USER NAME",
                      style: TextStyle(
                          fontSize: 22,
                          color: loginBtnColor,
                          fontWeight: FontWeight.bold),
                    ).tr(context: context),
                  ),
                  AccountScreenCard(
                    title: "User Name :".tr(),
                    subtitle: "Edit Your User Name".tr(),
                  ),
                  AccountScreenCard(
                    title: "Email :".tr(),
                    subtitle: "Edit Your Email",
                  ),
                  AccountScreenCard(
                    title: "Mobile Number :".tr(),
                    subtitle: "+249 1234 567 890",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  //File _image;

  final picker = ImagePicker();

  Future getImage(ImageSource img, BuildContext context) async {
    final pickedFile = await picker.getImage(
      source: img,
      imageQuality: 50, // <- Reduce Image quality
      maxHeight: 500, // <- reduce the image size
      maxWidth: 500,
    );

    setState(() {
      if (pickedFile != null) {
        // _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<GetPhoto> _asyncGetPhoto(BuildContext context) async {
    return await showDialog<GetPhoto>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select From ... ').tr(context: context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  getImage(ImageSource.camera, context);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Camera',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ).tr(context: context),
              ),
              SimpleDialogOption(
                onPressed: () {
                  getImage(ImageSource.gallery, context);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Gallery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ).tr(context: context),
              ),
            ],
          );
        });
  }
}

enum GetPhoto { camera, gallery }
