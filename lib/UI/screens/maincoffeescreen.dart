import 'package:flutter/material.dart';
import 'package:project_1/UI/categories/coffeetypepage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Coffee Shop"),
          backgroundColor: const Color(0xffC67C4E),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color.fromARGB(255, 53, 22, 2),
            unselectedLabelColor: Colors.black,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _tabs.map((tab) {
            return CoffeeTypePage(coffeeType: tab.text!);
          }).toList(),
        ),
      ),
    );
  }
}

const _tabs = [
  Tab(text: "Latte"),
  Tab(text: "Cappuccino"),
  Tab(text: "Espresso"),
  Tab(text: "Americano"),
  Tab(text: "Flat white"),
];
