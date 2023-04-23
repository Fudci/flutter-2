import 'package:flutter/material.dart';
import 'package:flutter_2/presentation/screens/home/page/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: HomePage(),
    );
  }
}
