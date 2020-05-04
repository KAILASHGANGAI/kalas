import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
//my own imports
import 'package:kalas1/componets/horizontal_listview.dart';
import 'package:kalas1/componets/products.dart';
import 'package:kalas1/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
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
        child: new ListView(
          children: <Widget>[
            //          header
            new UserAccountsDrawerHeader(accountName: Text('nitish'),
              accountEmail: null,
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.blueAccent
              ),
            ),
//       body

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
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.red),
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
}
