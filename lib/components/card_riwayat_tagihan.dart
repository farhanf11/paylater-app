import 'package:flutter/material.dart';
import 'package:paylater/history_page/detail_tagihan.dart';
import '../models/tagihan.dart';

class CardRiwayatTagihan extends StatelessWidget{

  final Tagihan tagihan;
  CardRiwayatTagihan(this.tagihan);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      child: Container(
        height: 160,
        child: Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Ink.image(image: NetworkImage(tagihan.imageUrl),
                width: 130,
                height: 130,
              ),

              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Nama
                  Row(
                    children: [
                      Text(tagihan.productName,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.grey, ),
                      ),
                    ],
                  ),

                  //cicilan
                  Row(
                    children: [
                      Text('Cicilan :'+ ' ' +tagihan.tenorCicilan.toString() + ' ' +'bulan', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.grey,),), SizedBox(width: 5,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Status :', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.grey,)), SizedBox(width: 5,),
                      Text(tagihan.statusTagihan,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Color(0xff1288B5),),
                      ),
                      SizedBox(width: 5,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Pembayaran :'+ ' ' +'Rp' + ' ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.grey,),),
                      Text(tagihan.hargaCicilan.toString(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.deepOrangeAccent,),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jatuh tempo :' + ' ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color:Colors.grey,),),
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