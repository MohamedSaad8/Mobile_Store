import 'package:flutter/material.dart';
import 'custom_text_form_feild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginUiBox extends StatefulWidget {
   loginUiBox({
    Key key,
    @required this.screenWidth,
    @required this.mode,

  }) : super(key: key);

  final double screenWidth;
  final bool mode ;
 static String email ;
 static String userName;
 static String password;

  @override
  _loginUiBoxState createState() => _loginUiBoxState();
}

class _loginUiBoxState extends State<loginUiBox> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.mode == false ? Text(
            "اسم المستخدم",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ) : Container(),
          widget.mode == false ?  CustomTextFormFiled(
            hintText: "ادخل اسم المستخدم" ,
            icon: Icons.person,
            data: (value){loginUiBox.userName = value ;},

          ) : Container(),
          widget.mode == false ? SizedBox(
            height: widget.screenWidth / 35,
          ) : Container(),
          Text(
            "البريد الالكتروني",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
          CustomTextFormFiled(
            hintText: "ادخل البريد الالكنروني هنا" ,
            icon: Icons.email,
            data: (value){loginUiBox.email = value ;},

          ),
          SizedBox(
            height: widget.screenWidth / 35,
          ),
          Text(
            "الرقم السري",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
          CustomTextFormFiled(
            hintText: "ادخل كلمة المرور هنا",
            icon: Icons.lock,
            data: (value){loginUiBox.password = value ;},

          ),
          widget.mode == false ? SizedBox(
            height: widget.screenWidth / 35,
          ) : Container(),
          widget.mode == false ? Text(
            "تاكيد الرقم السري",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ) : Container(),
          widget.mode == false ? CustomTextFormFiled(
            hintText: "ادخل كلمة المرور هنا",
            icon: Icons.lock,
            data: (value){loginUiBox.password = value ;},
          ) : Container(),
        ],
      ),
    );
  }
}

