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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/background/bg-landing.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/logo.png',
                                height: 48,
                              ),
                              Text(
                                'Paylater Syariah',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CarouselCard(),
                ],
              ),
            ),

            Container(
              height: 100,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(color: Colors.blue[400], fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.orangeAccent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white)),
                            prefixIcon: Icon(Icons.link),
                            suffix: ElevatedButton(
                              child: Text('Submit'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => NavbarBot())),
                            ),
                            hintText: 'Paste link here',
                            hintStyle:
                                TextStyle(color: Colors.blue, fontSize: 15)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'tempel link url barang yang ingin anda ajukan pada kolom diatas*',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //kategori
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KATEGORI',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.teal[700]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                CardCategories(Categories(
                                    id: 1,
                                    imageUrl:
                                        'assets/images/categories/pria.png',
                                    name: 'Pakaian Pria')),
                                SizedBox(
                                  width: 20,
                                ),
                                CardCategories(Categories(
                                    id: 2,
                                    imageUrl:
                                        'assets/images/categories/wanita.png',
                                    name: 'Pakaian Wanita')),
                                SizedBox(
                                  width: 20,
                                ),
                                CardCategories(Categories(
                                    id: 3,
                                    imageUrl:
                                        'assets/images/categories/elektronik.png',
                                    name: 'Elektronik')),
                                SizedBox(
                                  width: 20,
                                ),
                                CardCategories(Categories(
                                    id: 4,
                                    imageUrl:
                                        'assets/images/categories/anak-anak.png',
                                    name: 'Anak-anak')),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                CardCategories(Categories(
                                    id: 5,
                                    imageUrl:
                                        'assets/images/categories/kecantikan.png',
                                    name: 'Kecantikan')),
                                SizedBox(
                                  width: 20,
                                ),
                                CardCategories(Categories(
                                    id: 6,
                                    imageUrl:
                                        'assets/images/categories/kesehatan.png',
                                    name: 'Kesehatan')),
                                SizedBox(
                                  width: 20,
                                ),
                                CardCategories(Categories(
                                    id: 7,
                                    imageUrl:
                                        'assets/images/categories/kebutuhan-rumah.png',
                                    name: 'Kebutuhan Rumah')),
                                SizedBox(
                                  width: 20,
                                ),
                                CardCategories(Categories(
                                    id: 8,
                                    imageUrl:
                                        'assets/images/categories/olahraga.png',
                                    name: 'Olahraga')),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //trending product
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'TRENDING',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.teal[700]),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Card Product
                  Container(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 1,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Laptop New Asuz',
                                  price: '15.399.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 2,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1647503380147-e075b24f4cbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aXBob25lJTIwMTN8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 13 Promagh',
                                  price: '14.000.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 3,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1661961110372-8a7682543120?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MjJ8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Laptop Dell 232XD',
                                  price: '14.599.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Card Product
                  Container(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 1,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Laptop New Asuz',
                                  price: '15.399.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 2,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1647503380147-e075b24f4cbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aXBob25lJTIwMTN8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 13 Promagh',
                                  price: '14.000.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 3,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1661961110372-8a7682543120?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MjJ8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Laptop Dell 232XD',
                                  price: '14.599.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl:
                                      'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
