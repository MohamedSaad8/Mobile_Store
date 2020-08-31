import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/widget/my_drawer.dart';

void main() => runApp(MobileStore());

class MobileStore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mobile Store',
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Center(
              child: Text("home"),
            ),
            appBar: AppBar(
              title: Text("Home"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
            ),
            drawer: MyDrawer(),
          ),
        ));
  }
}
