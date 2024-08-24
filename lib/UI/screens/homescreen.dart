import 'package:flutter/material.dart';
import 'package:project_1/UI/screens/maincoffeescreen.dart';
import 'package:project_1/widgets/bottomnav/cart.dart';
import 'package:project_1/widgets/bottomnav/fav.dart';
import 'package:project_1/widgets/bottomnav/profile.dart';

class CollapsingAppbarPage extends StatefulWidget {
  const CollapsingAppbarPage({Key? key}) : super(key: key);

  @override
  State<CollapsingAppbarPage> createState() => _CollapsingAppbarPageState();
}

class _CollapsingAppbarPageState extends State<CollapsingAppbarPage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> coffeeImages = [
    {
      'image':
          'https://cdn.pixabay.com/photo/2021/12/08/19/34/laptop-6856557_1280.jpg',
      'label': 'Laptop'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2016/11/29/05/08/apple-1867461_1280.jpg',
      'label': 'Android phone'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2012/12/17/19/14/keyboard-70506_1280.jpg',
      'label': 'Keyboard'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/05/24/21/33/workplace-2341642_1280.jpg',
      'label': 'mouse'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/07/31/11/47/headphones-2557593_1280.jpg',
      'label': 'headphone'
    },
     {'image':
          'https://cdn.pixabay.com/photo/2016/10/17/18/48/iphone-7-1748383_1280.jpg',
      'label': 'Iphone'
    },
  ];

  final List<Map<String, String>> favoriteItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(
              selectedSize: "Medium", // Example size
              coffeeName: "Espresso", // Example name
              coffeeImage: coffeeImages[0]['image']!, // Example image
              coffeeDetails: "A strong and bold coffee", // Example details
              coffeePrice: 4.99, // Example price
            ),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavouriteScreen(favoriteItems: favoriteItems),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CoffeeShopSettingsPage1(),
          ),
        );
        break;
    }
  }

  void _navigateToMainScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homescreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                  "https://cdn.pixabay.com/photo/2017/08/03/11/22/laptop-2575689_1280.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select Your Electronic Item',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Expanded(child: _buildElectronicItemGrid()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildElectronicItemGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3 / 2,
        ),
        itemCount: coffeeImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle item tap
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            coffeeImages[index]['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              color: Colors.black.withOpacity(
                                  0.5), // Semi-transparent black background
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                coffeeImages[index]['label']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .white, // White text color for better contrast
                                ),
                                textAlign:
                                    TextAlign.center, // Center the label text
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
