import 'package:flutter/material.dart';
import 'package:mobilestore/models/categories_ofline.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mobilestore/widget/my_drawer.dart';
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {

  static String id  ="home" ;

  List<CategoriesOfLine> catInfo = [
    CategoriesOfLine(
        title: "Huawel", imageLocation: "images/companies/11.jpg"),
    CategoriesOfLine(
        title: "summsung", imageLocation: "images/companies/12.jpg"),
    CategoriesOfLine(title: "oppo", imageLocation: "images/companies/13.png"),
    CategoriesOfLine(title: "sony", imageLocation: "images/companies/14.jpg"),
    CategoriesOfLine(title: "Mi", imageLocation: "images/companies/15.png"),
    CategoriesOfLine(
        title: "nokia", imageLocation: "images/companies/16.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobile Store"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: screenHeight*.35,
              child: Carousel(
                images: [
                  ExactAssetImage("images/slider/1.jpg"),
                  ExactAssetImage("images/slider/2.jpg"),
                  ExactAssetImage("images/slider/3.jpg"),
                ],
                boxFit: BoxFit.cover,
              ),
            ),
            //first title "الاقسام"
            Container(
              padding: EdgeInsets.all(13),
              child: Text(
                "الاقسام",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: "Cairo",
                  fontSize: 30,
                ),
              ),
            ),
            //horizontal list for categories
            Container(
              height: screenHeight *.18,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    width: 130,
                    height: 100,
                    child: ListTile(
                      title: CircleAvatar(
                        backgroundImage: ExactAssetImage(
                          catInfo[index].imageLocation,
                        ),
                        maxRadius: 50,
                      ),
                      subtitle: Text(
                        catInfo[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  );
                },
                itemCount: catInfo.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // second title "اخر المنتجات"
            Container(
              padding: EdgeInsets.all(13),
              child: Text(
                "اخر المنتجات",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: "Cairo",
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              height: screenHeight*.55,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Image(image: ExactAssetImage("images/222.png"),fit: BoxFit.fill,),
                    footer: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black,
                        child: Text("Summsung note 10 pro",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
