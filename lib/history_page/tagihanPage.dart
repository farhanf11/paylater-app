import 'package:flutter/material.dart';

import '../components/card_tagihan.dart';
import '../models/tagihan.dart';

class TagihanPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            CardTagihan(Tagihan(
                id: 1,
                imageUrl: "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                productName: 'Laptop Azuz With Camera Action',
                tenorCicilan: 12,
                statusTagihan: 'Lunas',
                hargaCicilan: 4125899,
                hargaBarang: 14799000,
                tanggalJatuhTempo: '12/April/2023'
            ),
            ),
            SizedBox(height: 10,),
            CardTagihan(Tagihan(
                id: 1,
                imageUrl: "https://media.istockphoto.com/id/1454538009/id/foto/notebook-3d-dengan-kamera.jpg?s=612x612&w=0&k=20&c=OhsSXOO3jwsOR-z6XDio2Fo2iO1nbXhYX2m4viw6eQo=",
                productName: 'Laptop Azuz With Camera Action',
                tenorCicilan: 12,
                statusTagihan: 'Lunas',
                hargaCicilan: 4125899,
                hargaBarang: 14799000,
                tanggalJatuhTempo: '12/April/2023'
            ),
            ),
          ],
        ),
      ),
    );
  }

}