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

class AdminKeuangan extends StatefulWidget {
  @override
  _AdminKeuanganState createState() => _AdminKeuanganState();
}

class _AdminKeuanganState extends State<AdminKeuangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan Admin',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
    );
  }
}
