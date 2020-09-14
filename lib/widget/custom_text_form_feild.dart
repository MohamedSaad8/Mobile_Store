import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {

  String hintText ;
  IconData icon ;
  CustomTextFormFiled({@required this.hintText, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (hintText == "ادخل كلمة المرور هنا") ? true : false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        contentPadding: EdgeInsets.all(12),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
      ),
    );
  }
}