import 'package:flutter/material.dart';

class DetailCicilan extends StatefulWidget {
  const DetailCicilan({Key? key}) : super(key: key);

  @override
  State<DetailCicilan> createState() => _DetailCicilanState();
}

class _DetailCicilanState extends State<DetailCicilan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //Head
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffE3E9EB))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rincian Cicilan Pembayaran',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),

          //Tenor
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cicilan 1',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text('25-12-2022',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text('500.000',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),

          //Total Tagihan
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cicilan 2',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text('25-01-2023',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text('500.000',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),

          //Tagihan Tersisa
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cicilan 3',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text('25-02-2023',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text('500.000',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
