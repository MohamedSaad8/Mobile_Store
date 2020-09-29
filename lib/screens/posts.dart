import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  static String id = "posts";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("المنشورات"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      minLines: 1,
                      maxLines: 10,
                      maxLength: 250,
                      decoration: InputDecoration(
                          hintText: "اضف منشورك هنا . . .",
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                    ),
                    leading: CircleAvatar(child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("اضافة منشور"),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.add_box,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text("mohamed saad" , style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900,fontSize: 17),),
                                subtitle: Text(
                                    "لديا جهاز من نوع سامسونج جلاكسي 4 واريد بيعه لاعلي سعر وهذا لان حالته جيده جدا"),
                                trailing: Icon(Icons.more_vert),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width,
                                height : 55 ,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        onTap:(){} ,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text("اعجبني"),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Icon(
                                                Icons.thumb_up,
                                                color: Colors.grey,
                                              )
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap:(){

                                        } ,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text("تعليق"),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Icon(
                                                Icons.comment,
                                                color: Colors.grey,
                                              )
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(right: BorderSide(color: Colors.grey))
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
