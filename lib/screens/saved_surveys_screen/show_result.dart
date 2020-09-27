import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/local_database/back_result.dart';
import 'package:survey_app/local_database/description.dart';
import 'package:survey_app/local_database/moor_database.dart';
import 'package:survey_app/local_database/responses.dart';
import 'package:survey_app/screens/home_screen/HomeScreen.dart';
import 'package:easy_localization/easy_localization.dart';

class ShowResult extends StatefulWidget {
  final double percentage;
  final  double finalScore;
  final List <BackResults> backResult;
  final String googleLocation;
  final String surveyName;
  final String town;
  final int surveyId;
  final String comment;

  const ShowResult({Key key,this.percentage,  this.finalScore, this.backResult, this.googleLocation, this.surveyName, this.town, this.surveyId, this.comment})
      : super(key: key);
  @override
  _ShowResultState createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {

  ResultResponses responses;
  double percentageResult;
  double finalScore;



  final _scaffoldKey = GlobalKey<ScaffoldState>();


//// ...
//  if (between(x, 0.001, 0.009)) {
//  // something
//  }
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    print(widget.backResult);
    return Scaffold(

      key: _scaffoldKey,
      body: SafeArea(
          child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    " Final score : ${widget.finalScore}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Percentage : ${widget.percentage} %",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.  comment,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
//                  _scaffoldKey.currentState.showSnackBar(
////                      SnackBar(content: Text("downloading .....")));
//                 final static DateTime now=DateTime.now();
//                  final DateFormat formatter = DateFormat('yyyy-MM-dd');


                          final database =  Provider.of<AppDatabase>(
                              context,
                              listen: false);

                          var response =
                          await database.insertResults(Result(response: ResultResponses(
                              description: Description(
                                finalScore: finalScore.toString(),
                                town: widget.town,
                                surveyId: widget.surveyId,
                                googleLocation: widget.googleLocation,
                                surveyName: widget.surveyName,
                                // dateOfSubmission: "$now"


                              ),
                              responses: widget.backResult
                          )));

//                  response.catchError(
//                        (e) => _scaffoldKey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text("${e.toString()}"),
//                      ),
//                    ),
//                  );
//                  response.whenComplete(
//                        () => _scaffoldKey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text("done"),
//                        action: SnackBarAction(
//                          label: 'OK',
//                          onPressed: () {
//                            // Some code to undo the change.
//                          },
//                        ),
//                      ),
//                    ),
//                  );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        color: Colors.grey,
                        child: Text(("Done !!").tr()),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
