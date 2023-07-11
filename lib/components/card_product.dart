import 'package:flutter/material.dart';
import 'package:paylater/models/products.dart';
import 'package:paylater/user/DetailProduct.dart';

class CardProduct extends StatelessWidget{

  final Products products;
  CardProduct(this.products);

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Column(
              children: [
                Image.network(products.imageUrl,
                  width: 130,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(products.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                      ),
                      Text(products.price,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),

      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailProduct())),
    );
  }

}