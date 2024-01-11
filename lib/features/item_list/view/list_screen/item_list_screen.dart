import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'ItemListRoute')
class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SearchBar(),
          ListView.builder(itemBuilder: (context, index) {},),
        ],
      ),
    );
  }
}
