import 'package:flutter/material.dart';
import 'package:mobilestore/models/mobile.dart';
import 'package:mobilestore/services/MobilesAPI.dart';

class MobileInfo extends StatelessWidget {
  static String id = "mobile info";
  MobileAPI _mobileAPI = MobileAPI() ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "سامسونغ",
            style: TextStyle(fontFamily: "Cairo"),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Mobile>>(
          future: _mobileAPI.getMobileInfo(),
          builder: (context ,snapshot)
          {
            return ListView.builder(itemBuilder: (context , index){
              return Card(
                child: Text(snapshot.data[index].name),
              );
            } ,
            itemCount: snapshot.data.length,
            );
          },
        ),
      ),
    );
  }
}
