import 'package:mobilestore/models/posts.dart';
import 'package:mobilestore/models/users.dart';

class Comment
{
  int commentID;
  String commentContent ;
  Post commentPost;
  int commentUserID ;

  Comment({this.commentID, this.commentContent, this.commentPost,
      this.commentUserID});


}