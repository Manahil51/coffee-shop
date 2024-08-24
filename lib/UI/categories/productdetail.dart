import 'package:flutter/material.dart';
import 'package:project_1/widgets/bottomnav/cart.dart';

class Productdetails extends StatefulWidget {
  final double coffeePrice; // Add this parameter

  const Productdetails({
    required this.coffeePrice, // Update constructor
    super.key,
  });

  @override
  _ProductdetailsState createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  String _selectedSize = ''; 

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  void _addToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(
          selectedSize: _selectedSize,
          coffeeName: 'Vanilla Latte',
          coffeeImage: 'https://cdn.pixabay.com/photo/2018/06/08/23/26/coffee-3463352_1280.jpg',
          coffeeDetails: 'A latte with a hint of vanilla flavor. Our Vanilla Latte blends the rich, creamy taste of espresso with a touch of sweet vanilla. Perfectly frothy and irresistibly smooth, this drink is a delightful way to enjoy your coffee break. Served hot or iced, it\'s an indulgent treat that\'s sure to satisfy your cravings.',
          coffeePrice: widget.coffeePrice, // Pass price to CartScreen
        ),
      ),
    );
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              backgroundColor: const Color(0xffC67C4E),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: Text(
                  '\$${widget.coffeePrice.toStringAsFixed(2)}', // Use dynamic price
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  "https://cdn.pixabay.com/photo/2018/06/08/23/26/coffee-3463352_1280.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 121, 53, 11),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Vanilla Latte",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(66, 255, 255, 255),
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Text(
                    "A latte with a hint of vanilla flavor. Our Vanilla Latte blends the rich, creamy taste of espresso with a touch of sweet vanilla. Perfectly frothy and irresistibly smooth, this drink is a delightful way to enjoy your coffee break. Served hot or iced, it's an indulgent treat that's sure to satisfy your cravings.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Size Selection Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizeButton(
                      label: "Small",
                      isSelected: _selectedSize == "Small",
                      onTap: () => _selectSize("Small"),
                    ),
                    SizeButton(
                      label: "Medium",
                      isSelected: _selectedSize == "Medium",
                      onTap: () => _selectSize("Medium"),
                    ),
                    SizeButton(
                      label: "Large",
                      isSelected: _selectedSize == "Large",
                      onTap: () => _selectSize("Large"),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _addToCart,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 107, 68, 44),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 24.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  
  const SizeButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffC67C4E) : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
