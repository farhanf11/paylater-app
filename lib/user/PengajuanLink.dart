import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navbar/NavbarBot.dart';
import '../theme.dart';

class PengajuanLinkProduk extends StatefulWidget {
  const PengajuanLinkProduk({super.key});

  @override
  State<PengajuanLinkProduk> createState() => _PengajuanLinkProdukState();
}

class _PengajuanLinkProdukState extends State<PengajuanLinkProduk> {
  String? dropdownValue = "unj";
  Dio dio = Dio();
  String token = "";
  String _alamat = '';
  var id = 0;

  void _handleAlamat(String? value) {
    setState(() {
      _alamat= value!;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      id = prefs.getInt('id')!;
    });
  }

  final TextEditingController inputUrl = TextEditingController();
  final TextEditingController inputAlamat = TextEditingController();
  final TextEditingController inputVarian = TextEditingController();

  void PostLink(String url, String address, String note) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/link-store/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'url': url,
            'address': address,
            'note': note,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData['data']);
        if (responseData['success'] == false) {
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
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
          title: Text(responseData['data']['note']),
          actions: [
            TextButton(
              child: const Text('Ok'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaylaterTheme.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Pengajuan Link',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: PaylaterTheme.darkText,
              )),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: PaylaterTheme.spacer,
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Username
                Column(
                  children: [
                    ///url
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Url',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          // selectionHeightStyle:
                          //     BoxHeightStyle.includeLineSpacingMiddle,
                          controller: inputUrl,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              hintText: 'Masukan url produk',
                              hintStyle: TextStyle(
                                  color: PaylaterTheme.deactivatedText),
                              filled: true,
                              fillColor: PaylaterTheme.white),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///Varian
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Keterangan Varian',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 8,
                              fit: FlexFit.tight,
                              child: SizedBox(
                                width: double.infinity,
                                child: TextField(
                                  controller: inputVarian,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      hintText: 'Masukan keterangan varian produk',
                                      hintStyle: TextStyle(
                                          color: PaylaterTheme.deactivatedText),
                                      filled: true,
                                      fillColor: PaylaterTheme.white),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///alamat
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Alamat Pengiriman',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        ListTile(
                          leading: Radio<String>(
                            value: 'unj',
                            groupValue: _alamat,
                            onChanged: _handleAlamat,
                          ),
                          title: const Text('Koperasi Matematika UNJ'),
                        ),
                        ListTile(
                          leading: Radio<String>(
                            value: 'mandiri',
                            groupValue: _alamat,
                            onChanged: _handleAlamat,
                          ),
                          title: const Text('Alamat Sendiri'),
                        ),
                      ],
                    ),
                  ],
                ),

                ///button
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Color(0xff025464))),
                      onPressed: () => {PostLink(
                        inputUrl.text,
                        dropdownValue!,
                        inputVarian.text,
                      )},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text('Submit'),
                      ),
                    ),
                    const SizedBox(
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
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text("Batal")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
