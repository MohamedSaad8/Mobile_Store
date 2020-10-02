import "package:http/http.dart" as http;
import 'dart:convert';

Future<String> getUserNameByID(int userID) async {
  String userName;
  String url = "http://10.0.2.2:1337/users/${userID}";
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  userName = data["username"];
  return userName;
}

