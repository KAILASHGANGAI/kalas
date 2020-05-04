import 'package:flutter/material.dart';
import 'package:kalas1/main.dart';
import 'package:kalas1/userscreens/myHomePage.dart';
class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture

  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyHomePage()));
          },
          child:Text('KAlas'),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,
            color: Colors.white,),
              onPressed: (){}),

        ],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),

              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,
                    style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 20.0),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child:new Text("RS${widget.product_detail_old_price}",
                            style: TextStyle(color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          )
                      ),
                      Expanded(
                          child:new Text("RS${widget.product_detail_new_price}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                      )

                    ],
                  ),
                ),

              ),
            ),
          ),
          //   = = = =     //the first buttons=============
          Row(
            children: <Widget>[
              // =========the quqlity button============
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Qty"),
                            content: new Text("choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: new Text("close"),


                              )
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("color"),
                            content: new Text("choose the color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: new Text("close"),


                              )
                            ],
                          );
                        }
                    );
                  },
                  color: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("color"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              // =========the quqlity button============
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy Now"),
                ),

              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red,
                onPressed: (){},
              ),
              new IconButton(icon: Icon(Icons.favorite_border),color: Colors.red,
                onPressed: (){},
              )

            ],
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("product name",style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text(widget.product_detail_name),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("product brand",style: TextStyle(color: Colors.grey),),

              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("xxxxx"),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("product condition",style: TextStyle(color: Colors.grey),),

              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("good"),
              )
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("good engine with very fast work and working is fast"),
          ),
          //    ===   similar product section=====
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:new Text("Similar Products"),
          ),


          new Container(
            height: 340.0,
            child: Similar_products(),
          )
        ],

      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "rotabater",
      "picture": "agri/t1.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "smallbater",
      "picture": "agri/t2.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "junglecutter",
      "picture": "agri/t4.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "ricecutter",
      "picture": "agri/t5.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Nashak",
      "picture": "agri/p1.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "fixer",
      "picture": "agri/p2.png",
      "old_price": 100,
      "price": 50,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Similar_Single_prod(
              prod_name: product_list[index]['name'],
              prod_pricture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () =>Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context)=>new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_new_price: prod_price,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: prod_pricture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: new Row(children: <Widget>[
                      Expanded(
                        child: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                      ),
                      new Text("RS${prod_price}",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.red),)
                    ],),

                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}


