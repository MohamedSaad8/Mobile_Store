import "package:http/http.dart" as http;
import 'dart:convert';

class CommentAPI
{
  String url = "http://10.0.2.2:1337/comments" ;
  addComment({String commentContent , int userID , int postID}) async
  {
    var data = {
      "commentContent" : commentContent,
      "user" : "$userID",
      "post" : "$postID"
    };
    var response = await http.post(url , body: data);
    if(response.statusCode == 200)
    {
      print("comment add operation done");
    }
    else
    {
      print("not complete");
    }
  }
}