import 'package:flutter/material.dart';
import 'package:paylater/navbar/NavbarBot.dart';

import '../components/card_categories.dart';
import '../components/card_product.dart';
import '../models/categories.dart';
import '../models/products.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori', style: TextStyle(color: Colors.black),),
        backgroundColor: const Color(0xffffffff),
        leading: IconButton(
          icon: Icon( Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NavbarBot()))),
        ) ,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        color: const Color(0xffCFEEF4),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children:[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            CardCategories(Categories(id: 1, imageUrl: '../assets/images/categories/pria.png', name: 'Pakaian Pria')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 2, imageUrl: '../assets/images/categories/wanita.png', name: 'Pakaian Wanita')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 3, imageUrl: '../assets/images/categories/elektronik.png', name: 'Elektronik')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 4, imageUrl: '../assets/images/categories/anak-anak.png', name: 'Anak-anak')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 5, imageUrl: '../assets/images/categories/kecantikan.png', name: 'Kecantikan')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 6, imageUrl: '../assets/images/categories/kesehatan.png', name: 'Kesehatan')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 7, imageUrl: '../assets/images/categories/kebutuhan-rumah.png', name: 'Kebutuhan Rumah')),
                            SizedBox(width: 5,),
                            CardCategories(Categories(id: 8, imageUrl: '../assets/images/categories/olahraga.png', name: 'Olahraga')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'Pakaian Pria',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 1,
                                  imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Laptop New Asuz',
                                  price: '15.399.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 2,
                                  imageUrl: 'https://images.unsplash.com/photo-1647503380147-e075b24f4cbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aXBob25lJTIwMTN8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 13 Promagh',
                                  price: '14.000.000'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 3,
                                  imageUrl: 'https://images.unsplash.com/photo-1661961110372-8a7682543120?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MjJ8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Laptop Dell 232XD',
                                  price: '14.599.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl: 'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl: 'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl: 'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl: 'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl: 'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl: 'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl: 'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl: 'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl: 'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            CardProduct(
                              Products(
                                  id: 4,
                                  imageUrl: 'https://images.unsplash.com/photo-1587033411391-5d9e51cce126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBhZCUyMHByb3xlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                  name: 'Ipad Pro 2022',
                                  price: '17.000.000'
                              ),
                            ),
                            SizedBox(width: 32,),
                            CardProduct(
                              Products(
                                  id: 5,
                                  imageUrl: 'https://images.unsplash.com/photo-1664478546384-d57ffe74a78c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aXBob25lJTIwMTR8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                  name: 'Iphone 14 Pro Purple',
                                  price: '21.000.000'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}