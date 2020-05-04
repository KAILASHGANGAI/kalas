import 'package:flutter/material.dart';
import 'package:kalas1/componets/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          title: Text('Cart'),
          backgroundColor: Colors.red,
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search,color: Colors.white,),
                onPressed: (){}),


          ],
        ),
      body: new Cart_products(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("RS:100"),
            )),
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("check out",style: TextStyle(color: Colors.white),),
              color: Colors.red,),
            )
          ],
        ),
      ),



    );
  }
}
