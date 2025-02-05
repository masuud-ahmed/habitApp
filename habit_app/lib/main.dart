// main.dart
// import 'package:flutter/material.dart';
// import 'package:habbit_app/Screens/HomePage.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage()
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ Import GetX
import 'package:habbit_app/Screens/HomePage.dart';
import 'package:habbit_app/GetX/HabitController.dart'; // ✅ Import your controller

void main() {
  // ✅ Initialize GetX Controller
  Get.put(HabitController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // ✅ Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
