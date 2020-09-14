import 'package:flutter/material.dart';

import 'custom_text_form_feild.dart';

class loginUiBox extends StatelessWidget {
  const loginUiBox({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "البريد الالكتروني",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: screenWidth / 35,
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
        SizedBox(
          height: screenWidth / 35,
        ),
        CustomTextFormFiled(
          hintText: "ادخل كلمة المرور هنا",
          icon: Icons.lock,
        ),
      ],
    );
  }
}

