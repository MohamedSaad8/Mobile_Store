import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/models/mobile.dart';

class Details extends StatelessWidget {
  static String id = "details";
  TextStyle textStyle1 = TextStyle(
    fontFamily: "Cairo" ,
    fontSize: 18 ,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
  TextStyle textStyle2 = TextStyle(
    fontFamily: "Cairo" ,
    fontSize: 18 ,
    color: Colors.black,
      fontWeight: FontWeight.bold
  );
  TextStyle textStyle3 = TextStyle(
    fontFamily: "Cairo" ,
    fontSize: 18 ,
    color: Colors.blue,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    Mobile mobileData = ModalRoute.of(context).settings.arguments;
    double screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "التفاصيل",
              style: TextStyle(fontFamily: "Cairo"),
            ),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: screenHeight * .4,
                child: GridTile(
                  child: Image.network(
                    mobileData.url,
                   // fit: BoxFit.fill,
                  ),
                  footer: Opacity(
                    opacity: .4,
                    child: Container(
                      height: screenHeight * .1,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            mobileData.price + "\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            mobileData.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: screenHeight * .07,
                  child: Text("المواصفات" ,
                  style: TextStyle(
                    color: Colors.black ,
                    fontSize: 22 ,
                    fontWeight: FontWeight.bold ,
                    fontFamily: "Cairo"
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.white,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan> [
                        TextSpan(
                          text: "الموديل : " ,
                          style: textStyle2

                        ),
                        TextSpan(
                          text: mobileData.name ,
                          style: textStyle3
                        )
                      ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all( 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.blue,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "الحمايات : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: "مقاوم للماء والاتربة" ,
                              style: textStyle1
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 12 , right:  12 ,left:  12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.white,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "الكاميرا الاماميه : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: mobileData.camera ,
                              style: textStyle3
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all( 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.blue,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "البطاريه : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: mobileData.battery ,
                              style: textStyle1
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.white,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "المعالج : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: mobileData.cpu ,
                              style: textStyle3
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all( 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.blue,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "الحمايات : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: "مقاوم للماء والاتربة" ,
                              style: textStyle1
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.white,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "الموديل : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: mobileData.name ,
                              style: textStyle3
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all( 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.blue,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "الحمايات : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: "مقاوم للماء والاتربة" ,
                              style: textStyle1
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all( 12),
                child: Container(
                  padding: EdgeInsets.only(right: 13),
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: screenHeight * .07,
                  color: Colors.red,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: "السعر في مصر : " ,
                              style: textStyle2

                          ),
                          TextSpan(
                              text: mobileData.price,
                              style: textStyle1
                          )
                        ]
                    ),
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
