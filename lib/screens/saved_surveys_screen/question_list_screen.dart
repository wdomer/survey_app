import 'dart:convert';
import 'package:flutter/material.dart';
import '../../local_database/back_result.dart';
import '../../local_database/Question.dart';
import '../../local_database/description.dart';
import '../../widget/CustomRadioGroup.dart';

class QuestionListScreen extends StatefulWidget {
  final List<Question> question;
  final String googleLocation;
  final String surveyName;
  final String town;
  final int surveyId;

  const QuestionListScreen(
      {Key key, this.question, this.googleLocation, this.surveyName, this.town, this.surveyId})
      : super(key: key);
  @override
  _QuestionListScreenState createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  Description description;
  List<BackResults> backResult = [];
  List<CustomRadioGroup> customRadioGroup = [];
  List<double> finalScore = [];
   //double itemSize ;
//  static int questionCurrentIndex = 0;
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();


    super.initState();

  }

  void _addResult(BackResults newValue) {
    setState(() {
      backResult.add(newValue);
    });
  }

  void _addScore(double score) {
    setState(() {
      finalScore.add(score);
    });
  }

  double itemSize(){
    return MediaQuery.of(context).size.height;
  }
  _moveUp() {
    _controller.animateTo(_controller.offset - itemSize(),
        curve: Curves.elasticInOut, duration: Duration(milliseconds: 500));
  }

  _moveDown() {
    _controller.animateTo(_controller.offset +itemSize(),
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }


  @override
  Widget build(BuildContext context) {
    //  customRadioGroup.clear();
//    for (int i; i < widget.question.length; i++) {
//       customRadioGroup.add(
//         CustomRadioGroup(
//          results: results[i],
//
//         )
//       );
//    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              //  color: Colors.green,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
//                    RaisedButton(
//                      child: Text("Prev"),
//                      onPressed: _moveUp,
//                    ),
//                    RaisedButton(
//                      child: Text("down"),
//                      onPressed: _moveDown,
//                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                itemCount: widget.question.length,
                itemExtent: itemSize(),
                itemBuilder: (context, index) {
                  var q = widget.question[index];

                  List options = json.decode(q.options);
                  // List option;
                  List<String> opt = [];
                  List<String> sco = [];
                  String op = '';
                  for (var map in options) {
                    if (map["option"] != null && map["score"] != null) {
                      var op = map["option"];
                      var sc = map["score"];
                      opt.add(op);
                      sco.add(sc);
                    }
                  }

                  Map<String, String> map = new Map.fromIterables(sco, opt);

                  return CustomRadioGroup(
                    key: GlobalKey(),
                    question: q,
                    singleOption: opt,
                    length: widget.question.length,
                    index: index,
                    options: options,
                    map: map,
                    addScore: _addScore,
                    next: _moveDown,
                    googleLocation: widget.googleLocation,
                    surveyName: widget.surveyName,
                    town: widget.town,
                    surveyId: q.surveyId==null?widget.surveyId:q.surveyId,
                    finalResults: backResult,
                    addResult: _addResult,
                    finalScore: finalScore,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
//  Widget _builtQuestion(
//    BuildContext context,
//    //  Results results,
//    Question q,
//    int length,
//    int index,
//  ) {
//    List options = json.decode(q.options);
//    // List option;
//    List<String> opt = [];
//    List<String> sco = [];
//    String op = '';
//    for (var map in options) {
//      if (map["option"] != null && map["score"] != null) {
//        var op = map["option"];
//        var sc = map["score"];
//        opt.add(op);
//        sco.add(sc);
//        // print(map["option"].runtimeType);
//      }
//
//      //     option =map["option"];
//    }
////     print(opt);
////    print(sco);
//    Map<String, String> map = new Map.fromIterables(sco, opt);
//    print(map);
//
//    return CustomRadioGroup(
//        key: GlobalKey(),
//        question: q,
//        singleOption: opt,
//        length: length,
//        index: index + 1,
//        options: options,
//        map: map);
//  }
//}
