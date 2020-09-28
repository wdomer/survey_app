import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_app/local_database/all_surveys.dart';
import 'package:survey_app/local_database/moor_database.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:survey_app/services/surveys_all_services_local.dart';

class DownloadFormScreen extends StatefulWidget {
  final String token;

  const DownloadFormScreen({Key key, this.token}) : super(key: key);
  @override
  _DownloadFormScreenState createState() => _DownloadFormScreenState();
}

class _DownloadFormScreenState extends State<DownloadFormScreen> {
  bool isloading = false;
 // String token;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  void getToken() async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//    token = sharedPreferences.getString('token');
//  }




  @override
  Widget build(BuildContext context) {
    print("token/////////////////////////////");
    print(widget.token);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: Container(
            child: widget.token != null
                ? FutureBuilder(
                    future: Provider.of<SurveysAllServicesLocal>(context)
                        .getSurveysLocal("Bearer ${widget.token}", 0),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                            ),
                          );
                        } else {
                          final response = snapshot.data.body;

                          var survey = AllSurveys.fromJson(response);
                          var dataModel = survey.surveys.data;
                          return _buildList(context, dataModel);
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, var survey) {
    // var convertData=DataModel.fromJson(survey);
    // print(convertData);
    return ListView.builder(
        itemCount: survey.length,
        itemBuilder: (context, i) {
          print(survey[i]);
          return InkWell(
//            onTap: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondTest(
//                data: survey[i],
//              )));
//            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                survey[i].name,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "Created on  ".tr(),
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: survey[i].createdAt,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black38,
                                            fontSize: 12)),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      InkWell(
                        onTap: () async {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("downloading .....").tr()));
                          final database = await Provider.of<AppDatabase>(
                              context,
                              listen: false);

                          var response =
                              database.insertSurveys(Datum(surveys: survey[i]));
                          response.catchError(
                            (e) => _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("${e.toString()}"),
                              ),
                            ),
                          );
                          response.whenComplete(
                            () => _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("done").tr(context: context),
                                action: SnackBarAction(
                                  label: 'OK'.tr(),
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              ),
                            ),
                          );

                          print("response !!!!!!!!!!!!!!");
                          print(response);
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: Colors.black54)),
                            child: Icon(
                              Icons.file_download,
                              color: Colors.black54,
                            )
                            // SvgPicture.asset(
                            //  "assets/svg/download_form.svg",

//                  height: 35,
//                  width: 35,
                            //  ),
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
//with SingleTickerProviderStateMixin
//AnimationController animationController;
//Animation<Color> animationOne;
//Animation<Color> animationTwo;

//@override
//void initState() {
//  super.initState();
//  getToken();
//  animationController=AnimationController(
//      duration:Duration(milliseconds: 500),
//      vsync: this);
//  animationOne=ColorTween(begin: Colors.grey,end: Colors.grey.shade100).animate(animationController);
//  animationOne=ColorTween(begin: Colors.grey.shade100,end: Colors.grey).animate(animationController);
//  animationController.forward();
//
//  animationController.addListener(() {
//    if(animationController.status==AnimationStatus.completed){
//      animationController.reverse();
//    }else if(animationController.status==AnimationStatus.dismissed){
//      animationController.forward();
//    }this.setState(() {
//
//    });
//  });
//}
//
//ShaderMask(
//blendMode: BlendMode.srcATop,  // Add this
//shaderCallback: (Rect bounds) {
//return LinearGradient(
//
//colors: <Color>[animationOne.value, animationTwo.value],
//tileMode: TileMode.mirror,
//).createShader(bounds);
//},
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.center,
//children: [
//Container(
//height: MediaQuery.of(context).size.height/8,
//width: double.infinity,
//color: Colors.white,
//),
//SizedBox(height: 10,),
//
//Container(
//height: MediaQuery.of(context).size.height/8,
//width: double.infinity,
//color: Colors.white,
//),
//SizedBox(height: 10,),
//Container(
//height: MediaQuery.of(context).size.height/8,
//width: double.infinity,
//color: Colors.white,
//),
//SizedBox(height: 10,),
//Container(
//height: MediaQuery.of(context).size.height/8,
//width: double.infinity,
//color: Colors.white,
//),
//SizedBox(height: 10,),
//Container(
//height: MediaQuery.of(context).size.height/8,
//width: double.infinity,
//color: Colors.white,
//),
//SizedBox(height: 10,),
//],
//),
//);
