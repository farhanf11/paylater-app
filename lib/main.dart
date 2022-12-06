import 'package:flutter/material.dart';
import 'package:paylater/launcherPage.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'navbar/SearchBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
    );
  }
}
