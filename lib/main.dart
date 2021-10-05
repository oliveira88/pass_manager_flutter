import 'package:flutter/material.dart';
import 'package:pass_manager/screens/home_page.dart';

void main() {
  runApp(const PassManagerApp());
}

class PassManagerApp extends StatelessWidget {
  const PassManagerApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
