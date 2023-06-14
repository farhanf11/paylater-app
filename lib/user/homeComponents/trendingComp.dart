import 'package:flutter/material.dart';

import '../../components/card_product.dart';
import '../../models/products.dart';

class TrendingComp extends StatefulWidget {
  @override
  _TrendingCompState createState() => _TrendingCompState();
}

class _TrendingCompState extends State<TrendingComp> {
  @override
  Widget build(BuildContext context) {
    return //trending product
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Trending',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff025464)),
          ),
          SizedBox(
            height: 14,
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
    );
    ;
  }
}
