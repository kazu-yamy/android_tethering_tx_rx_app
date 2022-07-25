import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  var _selectIndex = 0;

  var _pages = <Widget>[

  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}