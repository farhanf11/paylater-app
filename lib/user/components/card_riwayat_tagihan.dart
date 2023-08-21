import 'package:flutter/material.dart';
import '../../models/tagihan.dart';
import '../history_page/detail_tagihan.dart';

class CardRiwayatTagihan extends StatelessWidget{

  final Tagihan tagihan;
  CardRiwayatTagihan(this.tagihan);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
        ),
        height: 120,
        child: Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Ink.image(image: NetworkImage(tagihan.imageUrl),
                width: 56,
                height: 56,
              ),

              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Nama
                  Row(
                    children: [
                      Text(tagihan.productName,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color:Colors.black, ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  //cicilan
                  Text('Cicilan :'+ ' ' +tagihan.tenorCicilan.toString() + ' ' +'bulan', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.black,),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text('Status :', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.black,)),
                      Text(tagihan.statusTagihan, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Color(0xff1288B5),),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Total Harga :'+ ' ' +'Rp' + ' ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.black,),),
                          Text(tagihan.hargaCicilan.toString(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color:Colors.deepOrangeAccent,),),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Text(tagihan.tanggalJatuhTempo.toString() + ' ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.grey,),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DetailTagihan())),
    );
  }
}