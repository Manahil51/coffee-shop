import 'package:flutter/material.dart';
import 'package:project_1/UI/categories/confirmation.dart';


class CartScreen extends StatelessWidget {
  final String selectedSize;
  final String coffeeName;
  final String coffeeImage;
  final String coffeeDetails;
  final double coffeePrice;

  const CartScreen({
    required this.selectedSize,
    required this.coffeeName,
    required this.coffeeImage,
    required this.coffeeDetails,
    required this.coffeePrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color(0xffC67C4E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Image.network(
                  coffeeImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffeeName,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        coffeeDetails,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Selected Size: $selectedSize',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Price: \$${coffeePrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Shipping Address',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your address',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final address = addressController.text;
                if (address.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationScreen(
                        coffeeName: coffeeName,
                        selectedSize: selectedSize,
                        coffeePrice: coffeePrice,
                        address: address,
                      ),
                    ),
                  );
                } else {
                  // Handle empty address case
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your address.')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 107, 68, 44),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: Center(
                child: const Text('Place Order', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
