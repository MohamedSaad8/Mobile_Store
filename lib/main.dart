import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/screens/home_screen.dart';


void main() => runApp(MobileStore());

class MobileStore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mobile Store',
        initialRoute: HomeScreen.id ,
      routes: {
          HomeScreen.id : (context)=>HomeScreen() ,
      },
    );
  }
}
