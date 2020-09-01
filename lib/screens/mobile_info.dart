import 'package:flutter/material.dart';
import 'package:mobilestore/models/mobile.dart';
import 'package:mobilestore/services/MobilesAPI.dart';

class MobileInfo extends StatelessWidget {
  static String id = "mobile info";
  MobileAPI _mobileAPI = MobileAPI() ;
  TextStyle style2 = TextStyle(
      fontFamily: "Cairo" ,
      color: Colors.blue ,
      fontSize: 15,
    fontWeight: FontWeight.bold
  );

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
            if(!snapshot.hasData)
              {
                return Center(child: CircularProgressIndicator(),);
              }
            else
              {
                return ListView.builder(itemBuilder: (context , index){
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        width: double.infinity,
                        child: Card(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Image(
                                  image: NetworkImage(snapshot.data[index].url),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(snapshot.data[index].name .toUpperCase() ,
                                      style: TextStyle(
                                          fontFamily: "Cairo" ,
                                          fontSize: 20 ,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(child: Text("الكاميرا : ${snapshot.data[index].camera}",style: style2,)),
                                        Expanded(child: Text("المعالج : ${snapshot.data[index].cpu}",style: style2)),

                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child: Text("البطارية : ${snapshot.data[index].battery}",style: style2)),
                                          Expanded(child: Text("اتلذاكرة : ${snapshot.data[index].memory}",style: style2)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text("السعر : ${snapshot.data[index].price}",style: style2),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } ,
                  itemCount: snapshot.data.length,
                );
              }
          },
        ),
      ),
    );
  }
}
