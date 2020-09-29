import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/providers/ui_mode.dart';
import 'package:mobilestore/screens/home_screen.dart';
import 'package:mobilestore/services/Auth.dart';
import 'package:mobilestore/widget/login_ui_box.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TapGestureRecognizer _signUpScreen;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Auth auth = Auth();
  @override
  void initState() {
    final mode1 = Provider.of<UiMode>(context, listen: false);
    _signUpScreen = new TapGestureRecognizer()
      ..onTap = () {
        mode1.changeLoginMode();
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final mode = Provider.of<UiMode>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: screenWidth / 1.5,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  LayoutBuilder(
                    builder: (context, constrain) {
                      double topCurveHeight = constrain.maxHeight;
                      return Transform.scale(
                        scale: 1.1,
                        child: Container(
                          height: topCurveHeight / 1.5,
                          decoration: BoxDecoration(
                              color: mode.loginMode
                                  ? Colors.grey[800]
                                  : Colors.yellow,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(topCurveHeight),
                                bottomRight: Radius.circular(topCurveHeight),
                              )),
                          child: Center(
                            child: mode.loginMode
                                ? Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  )
                                : Text(
                                    "انشاء حساب",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                  Transform.translate(
                    offset: Offset(screenWidth / 4 + screenWidth * .12,
                        screenWidth / 6.5 + screenWidth * .16),
                    child: CircleAvatar(
                      radius: screenWidth * .14,
                      backgroundColor:
                          mode.loginMode ? Colors.yellow : Colors.grey[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                              size: screenWidth * .14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: screenWidth / 2.5,
                    height: screenWidth / 1.2,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(screenWidth),
                          bottomRight: Radius.circular(screenWidth),
                        )),
                  ),
                  bottom: screenWidth / 10,
                  left: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          curve: mode.loginMode == false
                              ? Curves.easeInOutBack
                              : Curves.easeInBack,
                          height: mode.loginMode
                              ? screenWidth / 1.6
                              : screenWidth / 0.96,
                          width: screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Form(
                              autovalidate: true,
                              key: _globalKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                child: loginUiBox(
                                  screenWidth: screenWidth,
                                  mode: mode.loginMode,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mode.loginMode ? 15 : 0,
                      ),
                      mode.loginMode
                          ? Text(
                              "هل نسيت كلمة السر ؟",
                              style: TextStyle(fontSize: 18),
                            )
                          : SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: ButtonTheme(
                          buttonColor: Colors.blue[300],
                          child: RaisedButton(
                            onPressed: () async {
                              _globalKey.currentState.validate();
                              _globalKey.currentState.save();
                              if (mode.loginMode) {
                                await auth.login(
                                    email: loginUiBox.email,
                                    password: loginUiBox.password);
                                Navigator.pushNamed(context, HomeScreen.id);
                              } else {
                                await auth.signUp(
                                    email: loginUiBox.email,
                                    password: loginUiBox.password,
                                    userName: loginUiBox.userName);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    mode.loginMode
                                        ? "تسجيل الدخول"
                                        : "انشاء حساب",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue,
                              fontFamily: "Cairo"),
                          children: [
                            TextSpan(
                              text: mode.loginMode
                                  ? "في حالة ليس لديك حساب يمكنك  "
                                  : "في حاله ان لديك حساب  ",
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                            TextSpan(
                                text: mode.loginMode
                                    ? "انشاء حساب من هنا"
                                    : "سجل الدخول من هنا",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                recognizer: _signUpScreen),
                          ],
                        ),
                      ),
                      mode.loginMode == false
                          ? SizedBox(
                              height: 30,
                            )
                          : SizedBox(
                              height: 0,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
