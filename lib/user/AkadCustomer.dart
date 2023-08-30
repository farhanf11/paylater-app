
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/user/HistoryPage.dart';
import 'package:paylater/user/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../admin/component/popup.dart';
import '../theme.dart';

class RincianAkad extends StatefulWidget {
  const RincianAkad({Key? key, required this.fotoProduk, required this.namaProduk, required this.hargaProduk}) : super(key: key);
  final String fotoProduk;
  final String namaProduk;
  final int hargaProduk;

  @override
  State<RincianAkad> createState() => _RincianAkadState();
}

class _RincianAkadState extends State<RincianAkad> {
  _RincianAkadState();
  String fotoProduk = "";
  String namaProduk= "";
  int hargaProduk = 0;
  String token = "";
  var id = 0;

  void initState() {
    RincianProduk();
  }

  ///get rincian produk
  void RincianProduk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token')!;
    // var id = prefs.getInt('id')!;

    setState(() {
      fotoProduk = widget.fotoProduk;
      namaProduk = widget.namaProduk;
      hargaProduk = widget.hargaProduk;
    });
  }

  final TextEditingController dateController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ibukandungController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kotaControler = TextEditingController();

  ///post permintaan akad
  void EditAddress(String address) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/order-store/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'address': address,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => HistoryPage()));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Container(
              child: Text(responseData['message']),
            ),
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
      if (response.statusCode == 422) {
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
      if (response.statusCode == 404) {
        AlertDialog alert = AlertDialog(
          title: Text("Email tidak terdaftar"),
          content: Container(
            child: Text("Email yang anda masukan salah"),
          ),
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
  final _controller = TextEditingController();

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
                    'Rp '+hargaProduk.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pekerjaan',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: PaylaterTheme.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: PaylaterTheme.white,
                  ),
                  dropdownColor: PaylaterTheme.white,
                  hint: const Text(
                    "Choose",
                    style: TextStyle(
                        color: PaylaterTheme.deactivatedText,
                        fontWeight: FontWeight.w600),
                  ),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Admin', 'Pengawas', 'Customer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: PaylaterTheme.grey),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text('Cicilan : ', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500,
                    ),),
                    Text(
                      '1.200.000',
                      style: TextStyle(color: Colors.orange),
                    ),
                    Text('12 Bulan', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500,
                    ),),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                const Text(
                  'note : Harga yang ditetapkan sudah termasuk ongkir dan biaya\n layanan pada ecommerce',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Alamat Pengiriman', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),),
                SizedBox(height: 5,),
                RadioListTile(
                  title: Text("Koperasi FMIPA UNJ"),
                  value: "UNJ Kampus A, Gedung Dewi Sartika lt.5, Koperasi Matematika",
                  groupValue: alamat,
                  onChanged: (value) {
                    setState(() {
                      alamat = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Alamat Sendiri"),
                  value: "Jl.Ximpangan Raya",
                  groupValue: alamat,
                  onChanged: (value) {
                    setState(() {
                      alamat = value.toString();
                    });
                  },
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cattan', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),),
                    SizedBox(height: 5,),
                    TextFormField(
                      controller: _controller,
                      maxLines: 4,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: _controller.clear,
                          icon: Icon(Icons.clear),
                          color: PaylaterTheme.maincolor,

                        ),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Catatan',
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 60,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PaylaterTheme.maincolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Popup.confirmDialog(context,
                        message: "Konfirmasi data anda?",
                        dialogCallback: (value) async {
                          if (value == 'confirm') {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                          if (value == 'cancel') {}
                        });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Konfirmasi")),
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
