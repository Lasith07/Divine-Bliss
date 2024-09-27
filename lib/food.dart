import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int _quantity = 1; // Default quantity

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eve's Apple Pie"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image of the food item
            Center(
              child: Image.asset(
                'assets/pic1.jpg', // Path to your image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Food Name and Price
            Text(
              "Eve's Apple Pie",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Rs. 2700',
              style: TextStyle(
                fontSize: 22,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              "A heavenly apple pie with a crispy crust and divine apple filling. "
                  "Perfectly baked to perfection for a blissful experience!",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            // Quantity Selector
            Row(
              children: [
                const Text(
                  'Select Amount:',
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                ),
                Text(
                  '$_quantity',
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: const Icon(Icons.add),
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Add to Cart Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Added $_quantity x Eve\'s Apple Pie to cart',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Add to Cart'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
