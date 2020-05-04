import 'package:flutter/material.dart';
import 'package:kalas1/pages/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pricture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
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

