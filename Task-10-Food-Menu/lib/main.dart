import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodMenu(),
    );
  }
}

class FoodMenu extends StatelessWidget {
  FoodMenu({super.key});

  final List<Map<String, dynamic>> foodItems = [
    {
      "icon": Icons.lunch_dining,
      "name": "Cheese Burger",
      "price": "₹149"
    },
    {
      "icon": Icons.local_pizza,
      "name": "Veg Pizza",
      "price": "₹199"
    },
    {
      "icon": Icons.ramen_dining,
      "name": "Pasta",
      "price": "₹179"
    },
    {
      "icon": Icons.breakfast_dining,
      "name": "Sandwich",
      "price": "₹99"
    },
    {
      "icon": Icons.local_drink,
      "name": "Cold Drink",
      "price": "₹49"
    },
    {
      "icon": Icons.icecream,
      "name": "Ice Cream",
      "price": "₹69"
    },
    {
      "icon": Icons.cake,
      "name": "Chocolate Cake",
      "price": "₹149"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Example"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  foodItems[index]["icon"],
                  size: 40,
                  color: Colors.orange,
                ),
                title: Text(
                  foodItems[index]["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  foodItems[index]["price"],
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}