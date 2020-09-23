import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/local_database/moor_database.dart';
import 'package:survey_app/screens/survey_screen/components/SurveyScreenCard.dart';

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
            ),
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
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, i) {
          var data = result[i].response.description;
          print(data);
          return InkWell(
//            onTap: (){
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyDescriptionScreen(
//                data: data,
//              )));
//            },
            child: SurveyScreenCard(
              title: data.surveyName,
              subtitle: "05-Aug-2020 03:05 PM",
            ),
          );
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
