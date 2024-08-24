import 'package:flutter/material.dart';
import 'package:project_1/UI/categories/coffeeitem.dart';

import 'package:project_1/widgets/bottomnav/fav.dart';

class CoffeeTypePage extends StatefulWidget {
  final String coffeeType;

  const CoffeeTypePage({required this.coffeeType, Key? key}) : super(key: key);

  @override
  _CoffeeTypePageState createState() => _CoffeeTypePageState();
}

class _CoffeeTypePageState extends State<CoffeeTypePage> {
  final List<Map<String, String>> _favoriteItems = [];

  void _toggleFavorite(Map<String, String> coffeeItem) {
    setState(() {
      final existingIndex = _favoriteItems.indexWhere((item) => item['name'] == coffeeItem['name']);
      if (existingIndex >= 0) {
        _favoriteItems.removeAt(existingIndex);
      } else {
        _favoriteItems.add(coffeeItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final coffeeList = _getCoffeeList(widget.coffeeType);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffeeType),
        backgroundColor: const Color(0xffC67C4E),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavouriteScreen(favoriteItems: _favoriteItems),
              ));
            },
          ),
        ],
      ),
      body: coffeeList.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemCount: coffeeList.length,
              itemBuilder: (context, index) {
                final coffeeItem = coffeeList[index];
                final isFavorited = _favoriteItems.contains(coffeeItem);

                return CoffeeItem(
                  name: coffeeItem["name"]!,
                  imageUrl: coffeeItem["imageUrl"]!,
                  description: coffeeItem["description"]!,
                  onFavoriteToggle: (item) {
                    _toggleFavorite(item);
                  },
                  isFavorited: isFavorited,
                );
              },
            )
          : const Center(
              child: Text(
                'No items available',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

   List<Map<String, String>> _getCoffeeList(String coffeeType) {
    switch (coffeeType) {
      case "Latte":
        return [
          {
            "name": "Vanilla Latte",
            "imageUrl": "https://cdn.pixabay.com/photo/2018/06/08/23/26/coffee-3463352_1280.jpg",
            "description": "A latte with a hint of vanilla flavor.",
          },
          {
            "name": "Caramel Latte",
            "imageUrl": "https://cdn.pixabay.com/photo/2017/08/07/22/57/coffee-2608864_1280.jpg",
            "description": "A latte with a rich caramel flavor.",
          },
          {
            "name": "Hazelnut Latte",
            "imageUrl": "https://cdn.pixabay.com/photo/2019/10/21/16/48/table-4566563_960_720.jpg",
            "description": "A latte with a nutty hazelnut flavor."
          },
          {
            "name": "Pumpkin Spice Latte",
            "imageUrl": "https://cdn.pixabay.com/photo/2023/11/14/17/58/coffee-8388244_1280.jpg",
            "description": "A seasonal latte with a blend of pumpkin and spices."
          }
        ];
      case "Cappuccino":
        return [
          {
            "name": "Classic Cappuccino",
            "imageUrl": "https://cdn.pixabay.com/photo/2021/12/07/23/09/cup-6854258_960_720.jpg",
            "description": "A classic cappuccino with rich foam.",
          },
          {
            "name": "Mocha Cappuccino",
            "imageUrl": "https://cdn.pixabay.com/photo/2019/11/11/15/32/coffee-4618705_1280.jpg",
            "description": "A cappuccino with a rich mocha flavor."
          },
          {
            "name": "Vanilla Cappuccino",
            "imageUrl": "https://cdn.pixabay.com/photo/2023/10/26/13/19/coffee-8342636_1280.jpg",
            "description": "A cappuccino with a smooth vanilla flavor."
          },
          {
            "name": "Hazelnut Cappuccino",
            "imageUrl": "https://cdn.pixabay.com/photo/2022/01/31/15/18/coffee-6984075_960_720.jpg",
            "description": "A cappuccino with a nutty hazelnut flavor."
          }
        ];
      case "Espresso":
        return [
          {
            "name": "Classic Espresso",
            "imageUrl": "https://cdn.pixabay.com/photo/2020/04/13/10/48/coffee-5037800_1280.jpg",
            "description": "A classic espresso with rich flavor.",
          },
          {
            "name": "Mocha Espresso",
            "imageUrl": "https://cdn.pixabay.com/photo/2020/09/21/05/57/coffee-5589036_960_720.jpg",
            "description": "An espresso with a rich mocha flavor."
          },
          {
            "name": "Vanilla Espresso",
            "imageUrl": "https://cdn.pixabay.com/photo/2023/10/26/13/19/coffee-8342636_1280.jpg",
            "description": "An espresso with a smooth vanilla flavor."
          },
          {
            "name": "Hazelnut Espresso",
            "imageUrl": "https://cdn.pixabay.com/photo/2012/02/23/09/16/coffee-15994_960_720.jpg",
            "description": "An espresso with a nutty hazelnut flavor."
          }
        ];
      default:
        return [];
    }
  }
}