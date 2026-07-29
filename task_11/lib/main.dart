import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SmartCafeScreen(),
    );
  }
}

class SmartCafeScreen extends StatefulWidget {
  const SmartCafeScreen({super.key});

  @override
  State<SmartCafeScreen> createState() => _SmartCafeScreenState();
}

class _SmartCafeScreenState extends State<SmartCafeScreen> {
  final Map<String, Map<String, dynamic>> menu = {
    "Burger": {
      "icon": Icons.lunch_dining,
      "price": 120,
      "description": "Delicious Veg Burger"
    },
    "Pizza": {
      "icon": Icons.local_pizza,
      "price": 180,
      "description": "Cheesy Pizza"
    },
    "Sandwich": {
      "icon": Icons.breakfast_dining,
      "price": 90,
      "description": "Fresh Sandwich"
    },
    "Cold Coffee": {
      "icon": Icons.local_cafe,
      "price": 80,
      "description": "Cold Coffee"
    },
    "French Fries": {
      "icon": Icons.fastfood,
      "price": 70,
      "description": "Crispy Fries"
    },
  };

  String selectedCategory = "Burger";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final item = menu[selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Café"),
        backgroundColor: Colors.deepPurple,
        leading: const Icon(Icons.arrow_back),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "cheese",
                child: Text("Add Cheese"),
              ),
              PopupMenuItem(
                value: "sauce",
                child: Text("Extra Sauce"),
              ),
              PopupMenuItem(
                value: "nutrition",
                child: Text("View Nutrition"),
              ),
            ],
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        icon: const Icon(Icons.local_offer),
        label: const Text("Today's\nSpecial"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            const Text(
              "Choose Category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            DropdownButton<String>(
              value: selectedCategory,
              isExpanded: true,
              items: menu.keys.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: Icon(
                  item["icon"],
                  size: 60,
                  color: Colors.orange,
                ),
                title: Text(
                  selectedCategory,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(item["description"]),
                trailing: Text(
                  "₹${item["price"]}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Quantity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.deepPurple,
                ),

                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle),
                  color: Colors.deepPurple,
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "$selectedCategory Ordered Successfully!",
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Place Order"),
            ),

            const SizedBox(height: 10),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border),
              label: const Text("Save for Later"),
            ),

            TextButton.icon(
              onPressed: () {
                setState(() {
                  quantity = 1;
                  selectedCategory = "Burger";
                });
              },
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text(
                "Clear Selection",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}