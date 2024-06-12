import 'package:flutter/material.dart';
import 'package:tugas_7/checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Checkout',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: Checkout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
