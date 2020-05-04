import 'package:flutter/material.dart';
import 'userScreens/myHomePage.dart';
import 'package:kalas1/pages/home.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
      
    );
  }
}
