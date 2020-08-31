import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/models/categories_ofline.dart';
import 'package:mobilestore/screens/mobile_info.dart';
import 'package:mobilestore/widget/my_drawer.dart';

class Categories extends StatelessWidget {
  static String id = "categories";


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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "الاقسام",
            style: TextStyle(fontFamily: "Cairo"),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            )
          ],
        ),
        drawer: MyDrawer(),
        body:GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ), itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: ()
              {
                Navigator.pushNamed(context, MobileInfo.id);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(catInfo[index].imageLocation , fit:  BoxFit.cover,width: double.infinity,),
                    ),
                    Text(catInfo[index].title .toUpperCase() ,
                    style: TextStyle(
                      fontFamily: "Cairo" ,
                      fontWeight: FontWeight.bold ,
                      fontSize: 18
                    ),
                    )
                  ],
                ),
              ),
            ),
          );
        } ,

        itemCount: catInfo.length,)
      ),
    );
  }
}
