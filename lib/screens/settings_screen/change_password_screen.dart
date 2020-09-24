import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_app/models/change_password_model.dart';
import 'package:survey_app/services/change_password_services.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController _firstPasswordController;
  TextEditingController _secondPasswordController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _firstPasswordController = TextEditingController();
    _secondPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstPasswordController.dispose();
    _secondPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    // color: bgColor,
                  ),
                  child: TextFormField(
                    controller: _firstPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (v) {
                      if (v.isEmpty) {
                        return "New password";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "***********",
                        hintStyle: TextStyle(
                            letterSpacing: 2,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          //   color: loginBtnColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    // color: bgColor,
                  ),
                  child: TextFormField(
                    controller: _secondPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (v) {
                      if (v.isEmpty) {
                        return "ReEnter password";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "***********",
                        hintStyle: TextStyle(
                            letterSpacing: 2,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          //   color: loginBtnColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: MaterialButton(
                    color: Colors.grey,
                    onPressed: ()async {
                      SharedPreferences share=await SharedPreferences.getInstance();
                      String token=share.getString("token");
                      if(_formKey.currentState.validate()){
                        _scaffoldKey.currentState
                            .showSnackBar(SnackBar(
                            content: Text(
                                "please wait...!")));
                        ChangePasswordModel changePasswordModel=ChangePasswordModel(
                          password: _firstPasswordController.text
                        );

                        final change =Provider.of<ChangePasswordServices>(context,listen: false);

                        final response=await change.changePassword("Bearer $token",changePasswordModel,);

                        if(response.statusCode==200||response.statusCode==201){
                          _scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                              content: Text(
                                  "Done...!")));

                          Navigator.pop(context);

                        }
                        print(response.statusCode);
                        print(response.error);


                      }



                    },
                    child: Text("DONE"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
