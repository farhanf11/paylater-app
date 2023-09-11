import 'package:flutter/material.dart';

import '../../theme.dart';

class RincianPembayaran extends StatefulWidget {
  const RincianPembayaran({Key? key}) : super(key: key);

  @override
  State<RincianPembayaran> createState() => _RincianPembayaranState();
}

class _RincianPembayaranState extends State<RincianPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: PaylaterTheme.maincolor,
          ),
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12),
          child: const Text(
            'Rincian Pembayaran',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        ///Rincian pesanan
        const SizedBox(
          height: 24,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //ID Pesanan
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          style: BorderStyle.solid,
                          color: Color(0xffEBEBEB))),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID Pesanan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '12345678',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              //Tenor
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          style: BorderStyle.solid,
                          color: Color(0xffEBEBEB))),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tenor Cicilan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '3 Bulan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              //Total Tagihan
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          style: BorderStyle.solid,
                          color: Color(0xffEBEBEB))),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Tagihan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '1.500.000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              //Tagihan Tersisa
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tagihan Tersisa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '500.000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
