import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  TextStyle _style = TextStyle(
      color: Colors.black,
      fontSize: 18 ,
      fontFamily: "Cairo"
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Mohamed Saad"),
            accountEmail: Text("mohamedsaad.cis@gmail.com"),
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
            onTap: (){},
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
            onTap: (){},
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text(
              "حول التطبيق",
              style: _style,
            ),
            leading: Icon(
              Icons.help,
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
              "تسجيل الخروج",
              style: _style,
            ),
            leading: Icon(
              Icons.close,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),

            onTap: (){},
          ),
        ],
      ),
    );
  }
}
