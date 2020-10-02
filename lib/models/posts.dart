import 'package:mobilestore/models/comments.dart';
import 'package:mobilestore/models/users.dart';

class Post
{
  int postID;
  String postContent ;
  User postUser ;
  List<Comment> postComments ;
  Post({this.postID, this.postContent, this.postUser, this.postComments});


}