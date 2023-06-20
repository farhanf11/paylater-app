import 'dart:math';
import 'dart:ui';
import 'package:paylater/components/card_product.dart';
import 'package:paylater/models/categories.dart';
import 'package:paylater/models/products.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import '../components/card_categories.dart';
import '../landing_page/banner_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AdminAkun extends StatefulWidget {
  @override
  _AdminAkunState createState() => _AdminAkunState();
}

class _AdminAkunState extends State<AdminAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Akun',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
    );
  }
}
