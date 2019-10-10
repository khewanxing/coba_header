import 'package:coba_header/plain_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlainPage(
      header: "Main Page",
      subHeader: "Ini adalah header keren",
      child: Column(
        children: createItems(),
      ),
    );
  }
}

List<Widget> createItems() {
  return [
    Container(
      color: Colors.red[100],
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
    ),
    Container(
      color: Colors.green[100],
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
    ),
    Container(
      color: Colors.blue[100],
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
    ),
    Container(
      color: Colors.amber[100],
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
    ),
    Container(
      color: Colors.purple[100],
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
    )
  ];
}
