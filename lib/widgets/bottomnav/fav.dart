import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteItems;

  FavouriteScreen({required this.favoriteItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: const Color(0xffC67C4E),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                'No favorites added yet!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        item['imageUrl']!,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    title: Text(item['name']!),
                    subtitle: Text(item['description']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.red,
                      onPressed: () {
                       
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
