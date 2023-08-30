import 'package:flutter/material.dart';
import 'package:paylater/models/products.dart';
import 'package:paylater/theme.dart';
import 'package:paylater/user/AkadCustomer.dart';

class CardProduct extends StatelessWidget {
  final Products products;
  CardProduct(this.products);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                products.imageUrl,
                width: 130,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    products.name,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: PaylaterTheme.darkText,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    products.price,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[700],
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
