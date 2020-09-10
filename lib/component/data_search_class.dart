import 'package:flutter/material.dart';
import 'package:mobilestore/models/mobile.dart';
import 'package:mobilestore/screens/details.dart';
import 'package:mobilestore/services/MobilesAPI.dart';

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