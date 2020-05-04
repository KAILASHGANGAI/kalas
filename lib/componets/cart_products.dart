import 'package:flutter/material.dart';
class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Product_on_the_cart = [{
  "name": "rotabater",
  "picture": "agri/t1.jpg",
  "old_price": 120,
  "price": 85,
    "Qty":0,
  },
  {
  "name": "smallbater",
  "picture": "agri/t2.jpg",
  "price": 50,
  "Qty":3,
  "color":"red",
  }

  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Product_on_the_cart.length,
      itemBuilder: (context,index) {
        return Single_cart_product(
          Cart_prod_name: Product_on_the_cart[index]["name"],
          Cart_prod_color: Product_on_the_cart[index]["color"],
          Cart_prod_price: Product_on_the_cart[index]["price"],
          Cart_prod_pricture: Product_on_the_cart[index]["picture"],
          Cart_prod_Qty: Product_on_the_cart[index]["Qty"],

        );
      }

    );

  }
}
class Single_cart_product extends StatelessWidget {
  final Cart_prod_name;
  final Cart_prod_pricture;
  final Cart_prod_old_price;
  final Cart_prod_price;
  final Cart_prod_color;
  final Cart_prod_Qty;

  Single_cart_product({
    this.Cart_prod_color,
    this.Cart_prod_name,
    this.Cart_prod_old_price,
    this.Cart_prod_price,
    this.Cart_prod_pricture,
    this.Cart_prod_Qty,
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(Cart_prod_pricture,width: 100.0,height: 100.0,),
        title: new Text(Cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.all(8.0),
                 child: new Text("price:",style: TextStyle(fontWeight: FontWeight.bold,), ),
               ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("RS ${Cart_prod_price}",style: TextStyle(color: Colors.red),),
                ),
           
           //   =====this section for the pieces=========
                
                new Padding(padding: const EdgeInsets.fromLTRB(20.0, 4.0, 4.0, 4.0),
                  child: new Text("pieces:",
                      style: TextStyle(fontWeight: FontWeight.bold,))),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("${Cart_prod_Qty}",
                      style: TextStyle(color: Colors.blueAccent)),
        
                ),
              ],
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            new Text("${Cart_prod_Qty}"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})
          ],
        ),
      ),
    );
  }
}

