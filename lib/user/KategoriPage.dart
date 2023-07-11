import 'package:flutter/material.dart';
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
        backgroundColor: const Color(0xffE3E9EB),
        leading: const BackButton(),
        ) ,
      body: Container(
        color: const Color(0xffE3E9EB),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children:[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Text(
                    'Pakaian Pria',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff025464)),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CardProduct(
                            Products(
                                id: 1,
                                imageUrl: 'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/6/14/44601195-2b3f-4346-a402-40c724805912.jpg',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 2,
                                imageUrl: 'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/6/14/44601195-2b3f-4346-a402-40c724805912.jpg',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 3,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 4,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 5,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CardProduct(
                            Products(
                                id: 6,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 7,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 8,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 9,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                          SizedBox(height: 16,),
                          CardProduct(
                            Products(
                                id: 10,
                                imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGxhcHRvcHxlbnwwfDB8MHx8&auto=format&fit=crop&w=700&q=60',
                                name: 'Laptop New Asuz',
                                price: '15.399.000'
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}