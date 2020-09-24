import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_app/common/AppColors.dart';
import 'package:survey_app/models/login_model.dart';
import 'package:survey_app/screens/home_screen/HomeScreen.dart';
import 'package:survey_app/services/login_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = true;
  bool _isLoading = false;
  var _formKey = GlobalKey<FormState>();

  TextEditingController _emailController;
  TextEditingController _passwordController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('');
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: !_isLoading
              ? Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        "assets/images/screen/login_bg.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 100,
                      right: 100,
                      top: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "I.A.LOCATION",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 18),
                          ),
                          Text(
                            "explor with us",
                            style: TextStyle(
                              // color: Color(0xff004970ff),
                              color: loginBtnColor,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // SizedBox(
                          //   height: 10,
                          // ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .37,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: loginTextFieldBox),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: loginTextFieldBorderColor),
                                      borderRadius: BorderRadius.circular(10),
                                      // color: bgColor,
                                    ),
                                    child: TextFormField(
                                      controller: _emailController,
                                      style: TextStyle(color: Colors.white),
                                      validator: (v) {
                                        if (v.contains('@')) {
                                          return null;
                                        }
                                        return "Please your email";
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              letterSpacing: 1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: loginBtnColor,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: loginTextFieldBorderColor),
                                      borderRadius: BorderRadius.circular(10),
                                      // color: bgColor,
                                    ),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (v) {
                                        if (v.isEmpty) {
                                          return "Please your password";
                                        }
                                        return null;
                                      },
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: "***********",
                                          hintStyle: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.lock_outline,
                                            color: loginBtnColor,
                                          )),
                                    ),
                                  ),
                                  MaterialButton(
                                    // padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    color: loginBtnColor,
                                    onPressed: () async {
                                      SharedPreferences share =
                                      await SharedPreferences
                                          .getInstance();
                                      if (!_formKey.currentState.validate()) {
                                        print("not vaild");
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Email and Password is required")));
                                      }
                                      if (_formKey.currentState.validate() &&
                                          _rememberMe == true) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Email and Password is required")));

                                        LoginModel loginModel = LoginModel(
                                          device_name: "android",
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          name: '',
                                        );
                                        final response =
                                            await Provider.of<LoginServices>(
                                                    context,
                                                    listen: false)
                                                .login(loginModel);
                                        if (response.statusCode == 200 ||
                                            response.statusCode == 201) {
                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please wait ....")));
                                          String responseToken = response.body;

                                          share.setString(
                                              "token", responseToken);
                                          share.setString("rememberMe", "rememberMe");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen(
                                                        token:responseToken ,
                                                      )));
                                        }
                                        //  print(response.headers);
                                        print(response.body);
                                        print(response.statusCode);
                                        print(response.error);

//
                                      }
                                      if ((_formKey.currentState.validate())) {


                                        LoginModel loginModel = LoginModel(
                                          device_name: "android",
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          name: '',
                                        );
                                        final response =
                                            await Provider.of<LoginServices>(
                                                    context,
                                                    listen: false)
                                                .login(loginModel);
                                        if (response.statusCode == 200 ||
                                            response.statusCode == 201) {

                                          share.setString('token', response.body);
                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please wait ....")));
                                          String responseToken = response.body;

                                          share.setString(
                                              "token", responseToken);
                                          share.setString("rememberMe", "rememberMe");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen(
                                                        token: responseToken,
                                                      )));
                                        } else {

                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Email or password is not correct !")));
                                        }
                                      }
                                    },
                                    child: Text(
                                      "JOIN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: Row(
                                  children: <Widget>[
                                    Theme(
                                      data: ThemeData(
                                          //primaryColor: Colors.white,
                                          accentColor: Colors.white,
                                          unselectedWidgetColor: Colors.white),
                                      child: Checkbox(
                                        //  activeColor: Colors.white,
                                        checkColor: loginBgColor,
                                        focusColor: Colors.white,
                                        hoverColor: Colors.white,
                                        tristate: false,
                                        value: _rememberMe,

                                        onChanged: (bool newValue) {
                                          setState(() {
                                            _rememberMe = newValue;
                                            print(newValue);
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Forget my password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/facebook_icon.png",
                                  height: 30,
                                  width: 30,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/tweeter_icon.png",
                                  height: 30,
                                  width: 30,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  "assets/icons/inst_icon.png",
                                  height: 30,
                                  width: 30,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
