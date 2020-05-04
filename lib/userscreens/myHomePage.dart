import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kalas1/tools/app_data.dart';
import 'package:kalas1/tools/app_methods.dart';
import 'package:kalas1/tools/app_tools.dart';
import 'package:kalas1/tools/firebase_methods.dart';
import 'package:kalas1/pages/cart.dart';
import 'package:kalas1/componets/horizontal_listview.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:kalas1/componets/products.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:kalas1/userscreens/profile.dart';
import 'package:kalas1/userscreens/login.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  String acctName = "";
  String acctEmail = "";
  String acctPhotoURL = "";
  bool isLoggedIn;
  AppMethods appMethods = new FirebaseMethods();

  @override

  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    acctName = await getStringDataLocally(key: acctFullName);
    acctEmail = await getStringDataLocally(key: userEmail);
    acctPhotoURL = await getStringDataLocally(key: photoURL);
    isLoggedIn = await getBoolDataLocally(key: loggedIN);
    //print(await getStringDataLocally(key: userEmail));
    acctName == null ? acctName = "Guest User" : acctName;
    acctEmail == null ? acctEmail = "guestUser@email.com" : acctEmail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    Widget image_carousel = new Container(
      height: 150.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('agri/s1.jpg'),
          AssetImage('agri/s2.jpg'),
          AssetImage('agri/s3.png'),
          AssetImage('agri/s4.jpg'),
        ],
        autoplay: true,
        //    animationCurve: Curves.fastOutSlowIn,
        //   animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 2.0,
      ),
    );



    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text('KAlas'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => new Cart())
              );
            },
          )

        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(acctName),
              accountEmail: new Text(acctEmail),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text(isLoggedIn == true ? "Logout" : "Login"),
              onTap: checkIfLoggedIn,
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home page'),
                leading: Icon(Icons.home,color: Colors.green),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categoris'),
                leading: Icon(Icons.dashboard,color: Colors.green),
              ),
            ),

            InkWell(
              onTap: (){
              },
              child: ListTile(
                title: Text('my orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.green),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person,color: Colors.green),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.red),
              ),
            ),



          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel,
          //padding
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories',
              style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),

            ),),
          //horizontal list vieiw here of categories
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(22.0),
            child: new Text('Products',
              style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),),
          // grid view
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }

  checkIfLoggedIn() async {
    if (isLoggedIn == false) {
      bool response = await Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new Login()));
      if (response == true) getCurrentUser();
      return;
    }
    bool response = await appMethods.logOutUser();
    if (response == true) getCurrentUser();
  }


}
