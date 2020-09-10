import 'package:flutter/material.dart';
import 'package:mobilestore/models/categories_ofline.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mobilestore/models/mobile.dart';
import 'package:mobilestore/services/MobilesAPI.dart';
import 'package:mobilestore/widget/my_drawer.dart';

import 'details.dart';
// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {

  static String id  ="home" ;

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  MobileAPI mobileAPI =MobileAPI();

  List<String> mobilesNames = [] ;

  getNames ()async
  {
    for (var mob in await mobileAPI.getMobileInfo())
      {
        mobilesNames.add(mob.name.toLowerCase());
      }
  }

  @override
  void initState() {
    getNames();
    super.initState();
  }

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
              onPressed: () {
               /* return showDialog(context: context , builder: (context){
                  return AlertDialog(
                    title: Text("Search".toUpperCase()),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: <Widget>[
                          Text("this alert to make a search"),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "ابحث هنا"
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: (){
                          Navigator.pop(context) ;
                        },
                        child: Text("الغاء"),
                      ),
                      FlatButton(
                        onPressed: (){},
                        child: Text("تم"),
                      ),
                    ],
                  );
                }) ;*/
               return showSearch(context: context, delegate: DataSearch(mobilesNames)) ;

              },
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

class DataSearch extends SearchDelegate
{
  List<String> mobiles ;
  DataSearch(this.mobiles) ;
  MobileAPI mobileAPI = MobileAPI();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){query = "" ;},
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Mobile>>(
      future: mobileAPI.getMobileInfo(),
      builder: (context ,snapshot)
      {
        if(!snapshot.hasData)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        else
        {
          return ListView.builder(itemBuilder: (context , index){
            if(snapshot.data[index].name.toLowerCase() == query.toLowerCase())
              {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: ()
                    {
                      Navigator.pushNamed(context, Details.id,arguments: snapshot.data[index]);
                    //  snapshot.data[index].name = "this is a name must not found in mobile list" ;
                      snapshot.data.removeAt(index);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: double.infinity,
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image(
                                image:  NetworkImage(snapshot.data[index].url),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text( snapshot.data[index].name .toUpperCase()  ,
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
                                      Expanded(child: Text("الكاميرا : ${snapshot.data[index].camera }",)),
                                      Expanded(child: Text("المعالج : ${snapshot.data[index].cpu }",)),

                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(child: Text("البطارية : ${snapshot.data[index].battery}",)),
                                        Expanded(child: Text("اتلذاكرة : ${snapshot.data[index].memory}",)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text("السعر : ${snapshot.data[index].price}",),
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
              }
            else
              {
                return Container() ;
              }


          } ,
            itemCount: snapshot.data.length,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchList = [];
    if(query.isEmpty)
      {

        searchList = mobiles ;
      }
    else
      {
        searchList =  mobiles.where((p)=> p.startsWith(query.toLowerCase())).toList() ;
      }
    return ListView.builder(
      itemBuilder: (context , index){
        return ListTile(
          title: Text(searchList[index]),
          leading: Icon(Icons.mobile_screen_share),
          onTap: ()
          {
            query = searchList[index];
            showResults(context);

            },
        );
      },
      itemCount: searchList.length,
    );
  }


}
