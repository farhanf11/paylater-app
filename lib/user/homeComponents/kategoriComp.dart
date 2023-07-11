import 'package:flutter/material.dart';

import '../../components/card_categories.dart';
import '../../components/card_product.dart';
import '../../models/categories.dart';
import '../../models/products.dart';

class KategoriComp extends StatelessWidget {
  const KategoriComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //kategori
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kategori',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff025464)),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CardCategories(Categories(
                            id: 1,
                            imageUrl: '../assets/images/categories/pria.png',
                            name: 'Pakaian Pria')),
                        SizedBox(
                          width: 14,
                        ),
                        CardCategories(Categories(
                            id: 2,
                            imageUrl: '../assets/images/categories/wanita.png',
                            name: 'Pakaian Wanita')),
                        SizedBox(
                          width: 10,
                        ),
                        CardCategories(Categories(
                            id: 3,
                            imageUrl:
                                '../assets/images/categories/elektronik.png',
                            name: 'Elektronik')),
                        SizedBox(
                          width: 10,
                        ),
                        CardCategories(Categories(
                            id: 4,
                            imageUrl:
                                '../assets/images/categories/anak-anak.png',
                            name: 'Anak-anak')),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        CardCategories(Categories(
                            id: 5,
                            imageUrl:
                                '../assets/images/categories/kecantikan.png',
                            name: 'Kecantikan')),
                        SizedBox(
                          width: 10,
                        ),
                        CardCategories(Categories(
                            id: 6,
                            imageUrl:
                                '../assets/images/categories/kesehatan.png',
                            name: 'Kesehatan')),
                        SizedBox(
                          width: 10,
                        ),
                        CardCategories(Categories(
                            id: 7,
                            imageUrl:
                                '../assets/images/categories/kebutuhan-rumah.png',
                            name: 'Kebutuhan Rumah')),
                        SizedBox(
                          width: 10,
                        ),
                        CardCategories(Categories(
                            id: 8,
                            imageUrl:
                                '../assets/images/categories/olahraga.png',
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
    );
  }
}
