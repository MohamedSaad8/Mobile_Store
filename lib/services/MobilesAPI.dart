import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobilestore/models/mobile.dart';

class MobileAPI {
  List<Mobile> mobile = [];

  String url = "https://api.jsonbin.io/b/5f4dfaa64d8ce41113865186/2";

  String secretKey =
      "\$2b\$10\$K5JtvvZUs2LP9JSKJasDqONuSekBYps.wgA7SjWWd.ADkt4HoyjEq";

  Future<List<Mobile>> getMobileInfo() async {
    var response = await http.get(url, headers: {"secret-key": secretKey});
    var responseBody = jsonDecode(response.body);
    var mobileData = responseBody ;

    for(var mob in  mobileData){
      mobile.add(Mobile(
        name: mob["name"],
        camera: mob["camera"],
        cpu: mob["CPU"],
        battery: mob["battery"],
        memory: mob["memory"],
        price: mob["price"],
        url: mob["URL"]
      ));
    }
    return mobile ;
  }
}
