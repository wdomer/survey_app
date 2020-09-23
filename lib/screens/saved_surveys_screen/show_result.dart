import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/local_database/description.dart';
import 'package:survey_app/local_database/moor_database.dart';
import 'package:survey_app/local_database/responses.dart';
import 'package:survey_app/local_database/results.dart';
import 'package:survey_app/screens/home_screen/HomeScreen.dart';

class ShowResult extends StatefulWidget {
  //final double percentage;
  final List<double> finalScore;
  final List <AllResults> results;
  final String googleLocation;
  final String surveyName;
  final String town;
  final int surveyId;

  const ShowResult({Key key,  this.finalScore, this.results, this.googleLocation, this.surveyName, this.town, this.surveyId})
      : super(key: key);
  @override
  _ShowResultState createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {

  ResultResponses responses;
  double percentageResult;
  double finalScore;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double finalScore=0;

    for (num e in widget.finalScore) {
      finalScore += e;
    }

      if(finalScore!=0){

         percentageResult=finalScore/4;

      }

  //  print();
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
            " Percentage : $percentageResult %",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            " Final score : $finalScore",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
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
//                      SnackBar(content: Text("downloading .....")));

                  final database = await Provider.of<AppDatabase>(
                      context,
                      listen: false);

                  var response =
                  database.insertResults(Result(response: ResultResponses(
                    description: Description(
                      finalScore: widget.finalScore.toString(),
                      town: widget.town,
                      surveyId: widget.surveyId,
                      googleLocation: widget.googleLocation,
                      surveyName: widget.surveyName

                    ),
                    results: widget.results
                  )));

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
                        content: Text("done"),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ),
                    ),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeSceen(),
                    ),
                  );
                },
                color: Colors.grey,
                child: Text("Done !!"),
              ),
            ),
          )
        ],
      ))),
    );
  }
}
