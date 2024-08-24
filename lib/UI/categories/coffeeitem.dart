import 'package:flutter/material.dart';
import 'package:project_1/UI/categories/productdetail.dart';


class CoffeeItem extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String description;
  final Function(Map<String, String>) onFavoriteToggle;
  final bool isFavorited;

  const CoffeeItem({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.onFavoriteToggle,
    required this.isFavorited,
    Key? key,
  }) : super(key: key);

  @override
  _CoffeeItemState createState() => _CoffeeItemState();
}

class _CoffeeItemState extends State<CoffeeItem> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: isFavorited ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                    widget.onFavoriteToggle({
                      'name': widget.name,
                      'imageUrl': widget.imageUrl,
                      'description': widget.description,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorited
                              ? '${widget.name} added to favorites!'
                              : '${widget.name} removed from favorites!',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Productdetails(    coffeePrice: 32.4,)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffC67C4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: const Text("view details"),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
