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
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
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
                          backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrinkDetails(drink: drink)));
                      },
                    );
                  },
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Happy Sinha"),
                accountEmail: Text("happyk8651@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://srkarijobs.info/about-us/Happy-Sinha.jpg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Account"),
                subtitle: Text("Personal"),
                trailing: Icon(Icons.edit),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("happyk8651@gmail.com"),
//                trailing: Icon(Icons.send),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Add to Cart"),
                subtitle: Text("Shopping Cart"),
//                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
//                trailing: Icon(Icons.face),
                subtitle: Text("Favorite List"),
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text("About Us"),
                subtitle: Text("Our Missions"),
              ),
              ListTile(
                leading: Icon(Icons.perm_phone_msg),
                title: Text("Contact Us"),
                subtitle: Text("Contact to Customer Care "),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
