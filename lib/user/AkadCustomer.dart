
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/user/HistoryPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';

class RincianAkad extends StatefulWidget {
  const RincianAkad({Key? key}) : super(key: key);


  @override
  State<RincianAkad> createState() => _RincianAkadState();
}

class _RincianAkadState extends State<RincianAkad> {
  String fotoProduk = "";
  String namaProduk= "";
  int hargaProduk = 0;
  String url = "";
  String token = "";
  var id = 0;
  String _address = '';
  String _tenor = '';
  var address = "address";

  void _handleAddress(String? value) {
    setState(() {
      _address= value!;
    });
  }

  void _handleTenor(String? value) {
    setState(() {
      _tenor= value!;
    });
  }

  void initState() {
    RincianProduk();
  }

  ///get rincian produk
  void RincianProduk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    id = prefs.getInt('id')!;
    //
    // setState(() {
    //   fotoProduk = widget.fotoProduk;
    //   namaProduk = widget.namaProduk;
    //   hargaProduk = widget.hargaProduk;
    //   url = widget.url;
    // });
  }

  final TextEditingController addressController = TextEditingController();
  final TextEditingController tenorController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  ///post permintaan akad
  void AddOrder(String tenor, String address, String note) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/order-store/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'url': url,
            'image': fotoProduk,
            'title': namaProduk,
            'price': hargaProduk,
            'tenor': _tenor,
            'address': _address,
            'note': note,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => HistoryPage()));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      if (response.statusCode != 200) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String? alamat;
  String? dropdownValue = "Customer";
  TextEditingController inputCatatan = TextEditingController();

  @override
  void dispose() {
    inputCatatan.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Akad'),
        backgroundColor: PaylaterTheme.maincolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
        child: Column(
          children: [
            //detail produk
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 2))
                        ],
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              fotoProduk.toString()
                            ))),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    namaProduk.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Rp $hargaProduk',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),

            ///tenor
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '3',
                    groupValue: _tenor,
                    onChanged: _handleTenor,
                  ),
                  title: const Text('3 bulan'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '6',
                    groupValue: _tenor,
                    onChanged: _handleTenor,
                  ),
                  title: const Text('6 bulan'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '12',
                    groupValue: _tenor,
                    onChanged: _handleTenor,
                  ),
                  title: const Text('12 bulan'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            ///address
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gender',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Koperasi Rumpun Matematika UNJ, Gedung Dewi Sartika Lt.5, UNJ Kampus A, Rawamangun, Jakarta Timur',
                    groupValue: _address,
                    onChanged: _handleAddress,
                  ),
                  title: const Text('Di UNJ'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '6',
                    groupValue: _address,
                    onChanged: _handleAddress,
                  ),
                  title: Text(address),
                ),
              ],
            ),

            SizedBox(height: 60,),
            ///submit
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => {
                    AddOrder(
                      _address.toString(),
                      _tenor.toString(),
                      catatanController.text.toString(),
                    ),
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PaylaterTheme.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Batal")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
