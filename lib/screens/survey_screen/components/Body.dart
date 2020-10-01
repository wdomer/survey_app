import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../common/AppColors.dart';
import '../../../local_database/moor_database.dart';
import '../../../services/response_services.dart';


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
                  image: AssetImage("assets/images/screen/surveys_bg.png"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          top: 40,
          left: 120,
          right: 120,
          child: Center(
            child: Text(
              "SURVEYS",
              style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ).tr(),
          ),
        ),
        Positioned(
          top: 100,
          left: 10,
          right: 10,
          height: MediaQuery.of(context).size.height - 180,
          child: Container(
            child: Container(
                child: FutureBuilder(
              future: Provider.of<AppDatabase>(context).getAllResult(),
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
                    final response = snapshot.data;
                    print(response);

//                    return SurveyScreenCard(
//                      title: response.description .surveyName,
//                      subtitle: "05-Aug-2020 03:05 PM",
//                    );
                    return _buildList(context, response);
//
//
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
          ),
        )
        //  ListView.builder(itemBuilder: )
      ],
    );
  }

  Widget _buildList(BuildContext context, var result) {
    // var convertData=DataModel.fromJson(survey);
    // print(convertData);
    // print(convertData);
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, i) {
          var data = result[i].response.description;
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data.surveyName,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
//                            RichText(
//                              textAlign: TextAlign.start,
//                              text: TextSpan(
//                                text: "Created on  ",
//                                style: TextStyle(
//                                  color: Colors.black45,
//                                  fontSize: 12,
//                                  fontWeight: FontWeight.w600,
//                                ),
//                                children: <TextSpan>[
//                                  TextSpan(
//                                      text: data.createdAt,
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.w600,
//                                          color: Colors.black38,
//                                          fontSize: 12)),
//                                ],
//                              ),
//                            ),
                        ]),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () async {
                          SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
                          String authKey=sharedPreferences.getString("token");

                          final response= await Provider.of<ResponseServices>(context,listen: false).
                          sendResult("Bearer $authKey", result[i].response);

                        //  print(result[i]);

                          print(result[i].response);
                        //  print(result[i].response.results);
                          print(jsonEncode(result[i].response).runtimeType);
                          print(response.statusCode);
                          print(response.body);
                          print(response.error);


//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => SurveyDescriptionScreen(
//                        data: data,
//                      )));
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
                              Icons.file_upload,
                              color: Colors.black54,
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          final database =  Provider.of<AppDatabase>(
                              context,
                              listen: false);

                          var response = await database.deleteResults(result[i]);
                          setState(() {

                          });
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
                              Icons.delete,
                              color: Colors.black54,
                            )),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}

//child: SingleChildScrollView(
//child: Column(
//children: <Widget>[
//SurveyScreenCard(
//title: "Resturant Location ",
//subtitle: "05-Aug-2020 03:05 PM",
//),
//SurveyScreenCard(
//title: "New Location ",
//subtitle: "05-Aug-2020 03:05 PM",
//),
//SurveyScreenCard(
//title: "Test Location ",
//subtitle: "05-Aug-2020 03:05 PM",
//),
//SurveyScreenCard(
//title: "Resturant Location ",
//subtitle: "05-Aug-2020 03:05 PM",
//),
//],
//),
//),
