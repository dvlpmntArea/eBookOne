import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(229, 10, 10, 1),
        title: Text(
          "eBookOne",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black26,
      ),
    );
  }
}
