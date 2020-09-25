import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {

  String hintText ;
  IconData icon ;
  CustomTextFormFiled({@required this.hintText, @required this.icon});
  String _erroeMessage(String hint)
  {
    switch(hint)
    {
      case "ادخل اسم المستخدم" : return "اسم المستخدم فارغ";
      case "ادخل البريد الالكنروني هنا" : return "البريد الالكتروني فارغ" ;
      case "ادخل كلمة المرور هنا" : return "الرقم السري فارغ" ;

    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (hintText == "ادخل كلمة المرور هنا") ? true : false,
      validator: (value)
      // ignore: missing_return
      {
        if(value.isEmpty)
          {
            return _erroeMessage(hintText);
          // ignore: missing_return,
          }

      },
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),


      ),
    );
  }
}