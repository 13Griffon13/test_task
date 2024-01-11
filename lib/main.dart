import 'package:flutter/material.dart';
import 'package:test_task_1/features/item_list/view/detail_screen/detail_screen.dart';
import 'package:test_task_1/features/item_list/view/list_screen/item_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context) => const ItemListScreen(),
        '/details':(context) => const DetailScreen(),
      },
      title: 'List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
