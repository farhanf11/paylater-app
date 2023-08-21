import 'package:flutter/material.dart';
import '../../models/tagihan.dart';
import '../components/card_riwayat_tagihan.dart';

class RiwayatTagihan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CardRiwayatTagihan(Tagihan(
                id: 1,
                imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                productName: 'iPhone 13 Black, 128 gb',
                tenorCicilan: 12,
                statusTagihan: 'Lunas',
                hargaCicilan: 1399899,
                hargaBarang: 14799000,
                tanggalJatuhTempo: '12/April/2023'
            ),),
            SizedBox(height: 10,),
            CardRiwayatTagihan(Tagihan(
                id: 2,
                imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                productName: 'iPhone 13 Black, 128 gb',
                tenorCicilan: 12,
                statusTagihan: 'Lunas',
                hargaCicilan: 1399899,
                hargaBarang: 14799000,
                tanggalJatuhTempo: '12/April/2023'
            ),),
            SizedBox(height: 10,),
            CardRiwayatTagihan(Tagihan(
                id: 3,
                imageUrl: "https://media.istockphoto.com/id/1286249900/id/foto/merek-baru-iphone-12-pro-max-di-pacific-blue-di-pengaturan-studio.jpg?s=612x612&w=0&k=20&c=ejvqcTDMppI8slqjyRCP66UVJqHkfoAQHpinrini-gY=",
                productName: 'iPhone 13 Black, 128 gb',
                tenorCicilan: 12,
                statusTagihan: 'Lunas',
                hargaCicilan: 1399899,
                hargaBarang: 14799000,
                tanggalJatuhTempo: '12/April/2023'
            ),),
          ],
        ),
      ),
    );
  }

}