import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_1/UI/screens/homescreen.dart';

final List<PageData> pages = [
  const PageData(
    icon: Icons.electrical_services,
    title: "Find Your Electronics",
    bgColor: Colors.black,
    textColor: Colors.red,
  ),
  const PageData(
    icon: Icons.shopping_cart,
    title: "Add to Cart",
    bgColor: Colors.red,
    textColor: Colors.black,
  ),
  const PageData(
    icon: Icons.local_shipping,
    title: "Fast Delivery to Your Doorstep",
    bgColor: Colors.black,
    textColor: Colors.red,
  ),
];

class SliderOnboarding extends StatelessWidget {
  const SliderOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        itemCount: pages.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: false,
          enableInfiniteScroll: false,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final page = pages[index];
          return _Page(page: page, isLastPage: index == pages.length - 1);
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class _Page extends StatelessWidget {
  final PageData page;
  final bool isLastPage;

  const _Page({Key? key, required this.page, this.isLastPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: page.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: page.textColor,
            ),
            child: Icon(
              page.icon,
              size: screenHeight * 0.1,
              color: page.bgColor,
            ),
          ),
          Text(
            page.title ?? "",
            style: TextStyle(
              color: page.textColor,
              fontSize: screenHeight * 0.075,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (isLastPage)
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const CollapsingAppbarPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: page.textColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: screenHeight * 0.025,
                    color: page.bgColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
