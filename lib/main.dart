import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/providers/ui_mode.dart';
import 'package:mobilestore/screens/categories.dart';
import 'package:mobilestore/screens/details.dart';
import 'package:mobilestore/screens/home_screen.dart';
import 'package:mobilestore/screens/login_screen.dart';
import 'package:mobilestore/screens/mobile_info.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() => runApp(MobileStore(),);

class MobileStore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UiMode>(
          create: (context) => UiMode() ,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Cairo"
        ),
       // builder: DevicePreview.appBuilder,
        title: 'Mobile Store',
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          Categories.id: (context) => Categories(),
          MobileInfo.id : (context) => MobileInfo(),
          Details.id : (context) => Details(),
          LoginScreen.id : (context) => LoginScreen(),
        },
      ),
    );
  }
}
