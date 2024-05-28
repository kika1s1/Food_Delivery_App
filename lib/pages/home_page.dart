import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),
      
      ),
      drawer: MyDrawer(),
    );
  }
}