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
      backgroundColor: PaylaterTheme.spacer,
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: const [
                    PaylaterTheme.maincolor,
                    Color.fromRGBO(12, 166, 195, 1),
                  ]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Rp 85.000.000",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: PaylaterTheme.white)),
                      Text("Dana tersedia",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: PaylaterTheme.white)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 20,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: PaylaterTheme.maincolor),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.point_of_sale,
                        size: 14,
                        color: Color.fromARGB(255, 215, 194, 0),
                      ),
                      label: const Text("Tambah Dana",
                          style: TextStyle(
                              color: PaylaterTheme.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w600))),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: PaylaterTheme.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: PaylaterTheme.grey,
                    blurRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Data Cicilan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Data Cicilan Aktif',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Dana Belum Kembali',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.paid,
                                      size: 20,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("20",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.blueSky)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("cicilan",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(
                                      Icons.money_off,
                                      size: 20,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("28.335.559",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.decline)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Total Dana Keluar',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text("Rp",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.darkText)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("23.335.559",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.decline)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.credit_card_off,
                              size: 30,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Total Cicilan Masuk',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text("Rp",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.darkText)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("13.335.559",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.credit_card,
                              size: 30,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Total Cicilan Masuk',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text("Rp",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PaylaterTheme.darkText)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("7.335.559",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.trending_up,
                              size: 30,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
