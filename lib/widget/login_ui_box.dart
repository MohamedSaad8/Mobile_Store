import 'package:flutter/material.dart';
import 'package:mobilestore/models/categories_ofline.dart';
import 'package:mobilestore/providers/ui_mode.dart';
import 'package:provider/provider.dart';
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
        mode == false ? SizedBox(
          height: screenWidth / 35,
        ): Container(),
        mode == false ? CustomTextFormFiled(
          hintText: "ادخل كلمة المرور هنا",
          icon: Icons.lock,
        ) : Container(),
      ],
    );
  }
}

