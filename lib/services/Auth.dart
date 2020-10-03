import "package:http/http.dart" as http;
import 'dart:convert';
import '../constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth
{

  login({String email , String password}) async {
    Map<String,String> loginData = {
      "identifier" : email,
      "password" : password ,
    };
    var response = await http.post(url , body: loginData);
    if(response.statusCode == 200)
      {
        print("Login is success");
        var responseBody = jsonDecode(response.body);
        var data = responseBody;
        String token = data["jwt"] ;
        print(token);
          SharedPreferences sharedPreference = await SharedPreferences.getInstance();
          sharedPreference.setString("username", responseBody["user"]["username"]);
          sharedPreference.setString("email", responseBody["user"]["email"]);
          sharedPreference.setInt("userID", responseBody["user"]["id"]);


      }
    else{print("faild");}

  }

  signUp({String email, String password, String userName}) async {
    Map<String,String> signUpData = {
      "email" : email,
      "password" : password ,
      "username" : userName
    };
    var response = await http.post(signUpUrl , body: signUpData);
    if(response.statusCode == 200)
    {
      print("signUp is success");
      var responseBody = jsonDecode(response.body);
      var data = responseBody;
      String token = data["jwt"] ;
      print(token);

    }
    else{print("sign up faild");}
  }

}