import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/screens/categories.dart';
import 'package:mobilestore/screens/details.dart';
import 'package:mobilestore/screens/home_screen.dart';
import 'package:mobilestore/screens/mobile_info.dart';
//import 'package:device_preview/device_preview.dart';

void main() => runApp(MobileStore());

class MobileStore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      title: 'Mobile Store',
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        Categories.id: (context) => Categories(),
        MobileInfo.id : (context) => MobileInfo(),
        Details.id : (context) => Details()
      },
    );
  }
}
