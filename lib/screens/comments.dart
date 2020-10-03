import 'package:flutter/material.dart';
import 'package:mobilestore/models/posts.dart';
import 'package:mobilestore/services/API/commentAPI.dart';
import 'package:mobilestore/sharedMethods/getUserNameByUserID.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Comment extends StatefulWidget {
  static String id = "comments";

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  CommentAPI commentAPI = CommentAPI();
  int userID;
  String commentContent ;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userID = sharedPreferences.getInt("userID");
    if (userID != null) {
      setState(() {
        userID = userID = sharedPreferences.getInt("userID");
      });
    }
  }
  @override
  void initState() {
    getUserID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Post post = ModalRoute.of(context).settings.arguments;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 70,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: FutureBuilder(
                                future: getUserNameByID(
                                    post.postComments[index].commentUserID),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.data.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                              subtitle: Container(
                                  padding: EdgeInsets.all(10),
                                  color: Colors.grey[100],
                                  child: Text(
                                      post.postComments[index].commentContent)),
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: post.postComments.length),
              ),
              Positioned(
                bottom: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.camera_alt), onPressed: () {}),
                      Expanded(
                        child: Form(
                          key: globalKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onSaved: (value){commentContent = value;},
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {
                                    globalKey.currentState.save();
                                    commentAPI.addComment(commentContent: commentContent ,postID: post.postID , userID: userID);

                                  },
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(5),
                                hintText: "اكتب تعليقك هنا . . .",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
