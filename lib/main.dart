import 'package:coffee_me/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Coffee());
}

class Coffee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coffee Me",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
