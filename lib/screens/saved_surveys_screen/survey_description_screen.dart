import 'package:flutter/material.dart';
import 'package:survey_app/local_database/data.dart';
import 'package:survey_app/local_database/responses.dart';
import 'package:survey_app/screens/saved_surveys_screen/question_list_screen.dart';
import 'package:survey_app/widget/map_widget.dart';

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
          title: Text("Survey Description"),
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
                    hintText: "Town Name",
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
                      return "Enter Town Name";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Choose Location"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(color: Colors.grey[500]),
                child: MapWidget(
                  onTap:_addLatLong
                ),
              ),
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
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
