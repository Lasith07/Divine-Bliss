import 'package:flutter/material.dart';
import 'food.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Eats',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              MenuItem(
                name: "Eve's Apple Pie",
                price: 2700,
                image: 'assets/pic1.jpg',
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FoodScreen()),
                  );
                },
              ),
              MenuItem(
                name: "Paradise Pasta",
                price: 1500,
                image: 'assets/pic4.jpg',
                onTap: () {

                },
              ),
              const SizedBox(height: 20),


              const Text(
                'Drinks',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              MenuItem(
                name: "Blissed Ambrosia",
                price: 750,
                image: 'assets/pic2.jpg',
                onTap: () {

                },
              ),
              MenuItem(
                name: "Coffee Essentials",
                price: 700,
                image: 'assets/pic5.jpg',
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [

              Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs. $price',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
