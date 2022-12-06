import 'package:flutter/material.dart';
import 'package:paylater/models/products.dart';
import 'package:paylater/user/DetailProduct.dart';

class CardProduct extends StatelessWidget{

  final Products products;
  CardProduct(this.products);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        height: 160,
        width: 130,
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
              children: [
                Image.network(products.imageUrl,
                  width: 130,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10,),
                Text(products.name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10,),
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

      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailProduct())),
    );
  }

}