import 'dart:convert';
import 'package:coffee_me/Drink_Details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail";
  var res, drinks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);

    setState(() {});
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.brown,
          Colors.orangeAccent,
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Text("Coffee Me")),
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                        title: Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage:
                                NetworkImage(drink["strDrinkThumb"]),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DrinkDetails(drink: drink)));
                        });
                  },
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ),
      ),
    );
  }
}
