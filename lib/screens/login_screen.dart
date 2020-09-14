import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/widget/login_ui_box.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(topCurveHeight),
                                bottomRight: Radius.circular(topCurveHeight),
                              )),
                          child: Center(
                            child: Text(
                              "تسجيل الدخول",
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
                      backgroundColor: Colors.yellow,
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

                  /*Transform.scale(
                scale: 1.5,
                child: Transform.translate(
                  offset: Offset(0 , - screenWidth / 1.8),
                  child: Container(
                    width: double.infinity,
                    height: screenWidth ,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(screenWidth),
                    ),
                  ),
                ),
              ),
              Positioned(
                right:  screenWidth/1.6,
                bottom: screenWidth/5,
                child: Container(
                  width: screenWidth,
                  height: screenWidth ,
                  decoration: BoxDecoration(
                    color: Colors.blue[800].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(screenWidth),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0 , -screenWidth /8),
                child: Container(
                  height: screenWidth/2,
                  child: Center(
                    child: Text("تسجيل الدخول" ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Transform.translate(offset: Offset(0 , - screenWidth/1.88),
                child: CircleAvatar(radius: screenWidth/8,),),
              )*/
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
                        child: Container(
                          height: screenWidth / 1.7,
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                child: loginUiBox(screenWidth: screenWidth),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text("هل نسيت كلمة السر ؟" ,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        color: Colors.blue[300],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40 , vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.arrow_back , color: Colors.white,),
                              FlatButton(
                                onPressed: (){},
                                child: Text("تسجيل الدخول" ,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontFamily: "Cairo"
                          ),
                          children: [
                            TextSpan(
                              text: "في حالة ليس لديك حساب يمكنك  " ,
                              style: TextStyle(color: Colors.grey[800])
                            ),
                            TextSpan(

                                text: "انشاء حساب من هنا" ,
                              style: TextStyle(fontWeight: FontWeight.bold)
                            )

                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}


