import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
      image_location: 'agri/farmtool.jpg',
        image_caption: 'Farmtool',
          ),

          Category(
            image_location: 'agri/tool3.png',
            image_caption: 'Machine',
          ),
          Category(
            image_location: 'agri/s4.jpg',
            image_caption: 'seeds',
          ),


        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              subtitle: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2.5,
                alignment: Alignment.topCenter,
                child: Text(image_caption,

                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),),
              )
          ),
        ),
      ),
    );
  }
}
