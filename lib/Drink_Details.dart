import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  final drink;

  const DrinkDetails({Key key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Colors.orange,
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Text(drink["strDrink"])),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "ID: ${drink["idDrink"]}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Title: ${drink["strDrink"]}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
