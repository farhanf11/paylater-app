import 'package:flutter/material.dart';
import 'package:paylater/admin/admin_permintaanCicilan.dart';
import 'package:paylater/admin/models/modelTransaksi.dart';
import 'package:paylater/theme.dart';

class CardPermintaan extends StatelessWidget {
  final Transaksi transaksi;
  CardPermintaan(this.transaksi);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 180,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(transaksi.profileimg),
                          height: 15,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(transaksi.name,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Text(
                      transaksi.tanggalPembayaran,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink.image(
                      image: NetworkImage(transaksi.imageUrl),
                      width: 130,
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Nama
                        Row(
                          children: [
                            Text(
                              transaksi.productName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                          ],
                        ),

                        //Tenor cicilan
                        Row(
                          children: [
                            Text(
                              'Tenor Cicilan :' +
                                  ' ' +
                                  transaksi.tenorCicilan.toString() +
                                  ' ' +
                                  'bulan',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Harga :' + ' ' + 'Rp' + ' ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              transaksi.hargaBarang.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.orange,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Catatan :' + ' ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              transaksi.catatan.toString() + ' ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 23,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PaylaterTheme.decline,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Tidak Setuju',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: PaylaterTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 23,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: PaylaterTheme.accept,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Setujui Permintaan',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: PaylaterTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PermintaanCicilan())),
    );
  }
}

class CardBerlangsung extends StatelessWidget {
  final Transaksi transaksi;
  CardBerlangsung(this.transaksi);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 180,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(transaksi.profileimg),
                          height: 15,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(transaksi.name,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Text(
                      transaksi.tanggalPembayaran,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink.image(
                      image: NetworkImage(transaksi.imageUrl),
                      width: 130,
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Nama
                        Row(
                          children: [
                            Text(
                              transaksi.productName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                          ],
                        ),

                        //Tenor cicilan
                        Row(
                          children: [
                            Text(
                              'Tenor Cicilan :' +
                                  ' ' +
                                  transaksi.tenorCicilan.toString() +
                                  ' ' +
                                  'bulan',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Harga :' + ' ' + 'Rp' + ' ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              transaksi.hargaBarang.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.orange,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Catatan :' + ' ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              transaksi.catatan.toString() + ' ',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PermintaanCicilan())),
    );
  }
}

class CardSelesai extends StatelessWidget {
  final Transaksi transaksi;
  CardSelesai(this.transaksi);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 180,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(transaksi.profileimg),
                          height: 15,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(transaksi.name,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Text(
                      transaksi.tanggalPembayaran,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink.image(
                      image: NetworkImage(transaksi.imageUrl),
                      width: 130,
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Nama
                        Row(
                          children: [
                            Text(
                              transaksi.productName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Status :' + ' ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              transaksi.statusTransaksi,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cicilan:',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              transaksi.hargaCicilan.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: PaylaterTheme.orange,
                              ),
                            ),
                            Text(
                              ' x ',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              transaksi.tenorCicilan.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                            Text(
                              ' Bulan',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: PaylaterTheme.darkerText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PermintaanCicilan())),
    );
  }
}
