import 'package:mobilestore/models/posts.dart';

class User {

  int userID;
  String userName;
  String userEmail;
  List<Post> userPosts ;
  User({this.userID, this.userName, this.userEmail , this.userPosts});

}