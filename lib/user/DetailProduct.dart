import 'package:flutter/material.dart';
import 'package:paylater/navbar/NavbarBot.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xff00b29a),
        leading: IconButton(
            icon: Icon( Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NavbarBot()))),
      ) ,
      body: Container(
        color: const Color(0xffffffff),
        child: Center(
          child: Text(
            "Detail Produk",
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 45,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}