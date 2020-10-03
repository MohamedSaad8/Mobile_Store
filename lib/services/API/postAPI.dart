import 'package:mobilestore/models/comments.dart';
import 'package:mobilestore/models/posts.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:mobilestore/models/users.dart';

class PostsAPI {
  String postsURL = "http://10.0.2.2:1337/posts";

  Future<List<Post>> getAllPosts() async {
    var response = await http.get(postsURL);
    var data = jsonDecode(response.body);
    List<Post> posts = [];

    for (var post in data) {
      List<Comment> commentList = new List<Comment>();
      for (var comment in post["comments"]) {
        Comment comments =
        Comment(commentContent: comment["commentContent"],commentUserID: comment["user"] );
        commentList.add(comments);
      }
      posts.add(
        Post(
          postID: post["id"],
          postContent: post["postContent"],
          postUser: User(userName: post["user"]["username"]),
          postComments: commentList ,
        ),
      );
    }

    return posts;
  }

  Stream<List<Post>> getData (Duration duration) async* {

    while(true)
     {
        await Future.delayed(duration);
          yield await getAllPosts();
     }

  }

  addPost({String postContent , int userID}) async{

   var data = {
      "postContent" : postContent ,
      "user": "$userID"
    };

   var response = await http.post(postsURL ,body: data);
   if(response.statusCode == 200)
     {
       print("poste add operation done");
     }
   else
     {
       print("not complete");
     }

  }


}
