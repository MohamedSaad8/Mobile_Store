import 'package:flutter/material.dart';
import 'custom_text_form_feild.dart';

class loginUiBox extends StatelessWidget {
  const loginUiBox({
    Key key,
    @required this.screenWidth,
    @required this.mode
  }) : super(key: key);

  final double screenWidth;
  final bool mode ;


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          mode == false ? Text(
            "اسم المستخدم",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ) : Container(),
          mode == false ?  CustomTextFormFiled(
            hintText: "ادخل اسم المستخدم" ,
            icon: Icons.person,
          ) : Container(),
          mode == false ? SizedBox(
            height: screenWidth / 35,
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
          ),
          SizedBox(
            height: screenWidth / 35,
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
          ),
          mode == false ? SizedBox(
            height: screenWidth / 35,
          ) : Container(),
          mode == false ? Text(
            "تاكيد الرقم السري",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ) : Container(),
          mode == false ? CustomTextFormFiled(
            hintText: "ادخل كلمة المرور هنا",
            icon: Icons.lock,
          ) : Container(),
        ],
      ),
    );
  }
}

