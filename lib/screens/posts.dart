import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilestore/models/posts.dart';
import 'package:mobilestore/screens/comments.dart';
import 'package:mobilestore/services/API/postAPI.dart';

class Posts extends StatefulWidget {
  static String id = "posts";

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  PostsAPI postAPI = PostsAPI();

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
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
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
              child: StreamBuilder(
                stream: postAPI.getData(Duration(seconds: 3)),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
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
                                      title: Text(
                                        snapshot.data[index].postUser.userName,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 17),
                                      ),
                                      subtitle: Text(
                                          snapshot.data[index].postContent),
                                      trailing: Icon(Icons.more_vert),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      width: MediaQuery.of(context).size.width,
                                      height: 55,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {},
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
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, Comment.id,
                                                    arguments:
                                                        snapshot.data[index]);
                                              },
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
                                                    border: Border(
                                                        right: BorderSide(
                                                            color:
                                                                Colors.grey))),
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
                      itemCount: snapshot.data.length,
                    );
                  } else
                    return Container(
                      child: Text("no data in snapshot"),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
