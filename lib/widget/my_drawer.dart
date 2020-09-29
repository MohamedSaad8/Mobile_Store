import 'package:flutter/material.dart';
import 'package:mobilestore/screens/categories.dart';
import 'package:mobilestore/screens/home_screen.dart';
import 'package:mobilestore/screens/login_screen.dart';
import 'package:mobilestore/screens/posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  TextStyle _style = TextStyle(
      color: Colors.black,
      fontSize: 18 ,
      fontFamily: "Cairo"
  );

  String userName ;
  String email ;
  bool isLogin = false ;

  getUserInfo() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    userName = sharedPreference.getString("username");
    email = sharedPreference.getString("email") ;
    if(userName != null)
    setState(() {
      userName = sharedPreference.getString("username");
      email = sharedPreference.getString("email") ;
      isLogin = true ;
    });

  }
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: isLogin == true ? Text(userName) : Text(""),
            accountEmail: isLogin == true ? Text(email) : Text(""),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://torange.biz/photofx/177/8/technology-cell-computer-modern-techno-texture-ruler-line-grid-177199.jpg",
                    ),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text(
              "الصفحة الرئيسية",
              style: _style,
            ),
            leading: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, HomeScreen.id);

            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "الاقسام",
              style: _style,
            ),
            leading: Icon(
              Icons.category,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, Categories.id);

            },
          ),
          Divider(
            color: Colors.grey,
          ),
         isLogin ? ListTile(
            title: Text(
              "اضافة منشور",
              style: _style,
            ),
            leading: Icon(
              Icons.add_box,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),

            onTap: (){
              Navigator.pushNamed(context, Posts.id) ;
            },
          ) : Container(),
         isLogin ? Divider(
            color: Colors.grey,
          ) : Container(),
          ListTile(
            title: Text(
              "الاعدادات",
              style: _style,
            ),
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onTap: (){},
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              isLogin == false ?  "تسجيل الدخول" : "تسجيل الخروج",
              style: _style,
            ) ,
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),

            onTap: ()async{
              if(isLogin == false)
                {
                  Navigator.pushNamed(context, LoginScreen.id) ;
                }
              else
                {
                  SharedPreferences s =await  SharedPreferences.getInstance();
                  s.remove("username");
                  s.remove("email");
                  setState(() {
                    isLogin = false;
                  });
                  Navigator.pushNamed(context, LoginScreen.id) ;
                }
            },
          ),
        ],
      ),
    );
  }
}
