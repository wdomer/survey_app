import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../common/AppColors.dart';
import '../../local_database/data.dart';
import '../../local_database/responses.dart';
import '../../screens/saved_surveys_screen/question_list_screen.dart';
import '../../widget/map_widget.dart';


class SurveyDescriptionScreen extends StatefulWidget {
  final DataModel data;
// town{user input} ,*
// google_location{google map},*  "{17.3937369,78.4585406,438.5}"*,
// survey_name{BuiltData{name}}*,
// survey_id{BuiltQuestion}*,
// final_sore{calculate question score},
// date_of_submission {current_date}
  const SurveyDescriptionScreen({Key key, this.data}) : super(key: key);

  @override
  _SurveyDescriptionScreenState createState() =>
      _SurveyDescriptionScreenState();
}

class _SurveyDescriptionScreenState extends State<SurveyDescriptionScreen> {
  var _descriptionFormKey = GlobalKey<FormState>();
  TextEditingController _townController;
  ResultResponses result = ResultResponses();
  String latitude='15.5007' ;
  String longitude='32.5599';

  @override
  void initState() {
    super.initState();
    _townController = TextEditingController();
  }

  @override
  void dispose() {
    _townController.dispose();
    super.dispose();
  }

  void _addLatLong(String lat,lon){
    setState(() {
      latitude=lat;
      longitude=longitude;
    });
    print(lat);
    print(lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Survey Description").tr(context: context),
        ),
        body: Form(
          key: _descriptionFormKey,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                //  padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _townController,
                  decoration: new InputDecoration(
                    hintText: "Town Name".tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Town Name".tr();
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                //  padding:  EdgeInsets.all(8.0),
                child: TextFormField(
               //   controller: _townController,
                  decoration: new InputDecoration(
                    hintText: "Road".tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return "Enter Road Name".tr();
//                    }
//                    return null;
//                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(10),
                child: RichText(
                    text:TextSpan(text:"Choose Location"  .tr(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black54),
                        children: <TextSpan>[
                             TextSpan(text: ' (tap on location)', style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey)),
                         ], )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(color: Colors.grey[500]),
                child: MapWidget(
                  onTap:_addLatLong
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                //  padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                //  controller: _townController,
                  decoration: new InputDecoration(
                    hintText: "Point of Interests".tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return "Enter Point of Interrest".tr();
//                    }
//                    return null;
//                  },
                ),
              ),
              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.all(10.0),
                //  padding:  EdgeInsets.all(8.0),
                child: TextFormField(
             //     controller: _townController,
                  decoration: new InputDecoration(
                    hintText: "Build Of Specification".tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return "Enter Road Name".tr();
//                    }
//                    return null;
//                  },
                ),
              ),
              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.all(10.0),
                //  padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                 // controller: _townController,
                  decoration: new InputDecoration(
                    hintText: "Rent".tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return "Enter Rent".tr();
//                    }
//                    return null;
//                  },
                ),
              ),
              SizedBox(height: 10,),

              Container(
                margin: EdgeInsets.all(10.0),
                //  padding:  EdgeInsets.all(8.0),
                child: TextFormField(
               //   controller: _townController,
                  decoration: new InputDecoration(
                    hintText: "Total Shop Rent".tr(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return "Enter Total Shop Rent".tr();
//                    }
//                    return null;
//                  },
                ),
              ),

              SizedBox(height: 10,),

              InkWell(
                onTap: ()async{
                  _asyncGetPhoto(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text("CHOOSE IMAGE 0 DEG",style: TextStyle(color: white),)),
                ),
              ),
              SizedBox(height: 10,),

              InkWell(
                onTap: ()async{
                  _asyncGetPhoto(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text("CHOOSE IMAGE 30 DEG",style: TextStyle(color: white),)),
                ),
              ),
              SizedBox(height: 10,),

              InkWell(
                onTap: ()async{
                  _asyncGetPhoto(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text("CHOOSE IMAGE INSIDE",style: TextStyle(color: white),)),
                ),
              ),
              SizedBox(height: 10,),

              InkWell(
                onTap: ()async{
                  _asyncGetPhoto(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,

                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(child: Text("CHOOSE IMAGE 180 DEG",style: TextStyle(color: white),)),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {

                        if (_descriptionFormKey.currentState.validate()) {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionListScreen(
                                  question: widget.data.question,
                                  googleLocation:"{$latitude,$longitude,438.5}" ,
                                  surveyName: widget.data.name,
                                  town: _townController.text,
                                  surveyId:widget.data.id
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ).tr(context: context),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
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