import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';


class PostPengajuanProduk extends StatefulWidget {
  const PostPengajuanProduk({Key? key, required this.link_id, required this.user_id, required this.url, required this.address, required this.note}) : super(key: key);

  final int link_id;
  final int user_id;
  final String url;
  final String address;
  final String note;


  @override
  State<PostPengajuanProduk> createState() => _PostPengajuanProdukState();
}

class _PostPengajuanProdukState extends State<PostPengajuanProduk> {
  String token = "";
  var user_id = 0;
  var link_id = 0;
  var url = "";
  var note = "";
  var address = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController ongkirController = TextEditingController();

  void CreateOrder(String title, String price, String image,
      String ongkir) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/order-create/${widget.user_id}'),
          headers: {
            'Authorization': token,
          },
          body: {
            'title': title,
            'price': price,
            'image': image,
            'ongkir': ongkir,
            'url': widget.url,
            'link_id': widget.link_id.toString(),
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => AdminNavbarBot()));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      if (response.statusCode != 200) {
        var responseData = json.decode(response.body);
        print(responseData);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
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

  void RejectLink() async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/reject-link/${widget.link_id}'),
          headers: {
            'Authorization': token,
          },
          body: {
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(link_id);
        print(responseData);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => AdminNavbarBot()));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }

      }
      else {
        var responseData = json.decode(response.body);
        print(link_id);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          content: const Text('Tidak sesuai'),
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
        backgroundColor: Color(0xff025464),
        title: const Text(
          'Rincian Produk',
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xffF6F6F6),
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///username
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Color(0xffEBEBEB))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'url',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 20,),
                          Flexible(
                              child: Text(
                                widget.url.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                          ),
                          PopupMenuButton(
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(
                                    CupertinoIcons.ellipsis_vertical,
                                    size: 16,
                                  ),
                                ),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 1,
                                  child: TextButton(
                                      onPressed: () async {
                                        await Clipboard.setData(
                                            ClipboardData(
                                                text:
                                                widget.url));
                                        AlertDialog alert = AlertDialog(
                                          title: const Text('Berhasil Menyalin Link'),
                                          backgroundColor: Colors.white,
                                          icon: const Icon(
                                              CupertinoIcons
                                                  .checkmark_seal_fill,
                                              size: 20),
                                          iconColor: PaylaterTheme.maincolor,
                                          actions: [
                                            TextButton(
                                              child: const Text('Ok'),
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                          ],
                                        );
                                        showDialog(
                                            context: context,
                                            builder: (context) => alert);
                                      },
                                      child: const Text(
                                        'salin',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                              ])
                        ],
                      ),
                    ),

                    ///varian
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Color(0xffEBEBEB))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Varian',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          Flexible(child: Text(
                            widget.note,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),)
                        ],
                      ),
                    ),

                    ///alamat
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Alamat',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 32,),
                          Flexible(child: Text(
                            widget.address,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              ///Nama
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Produk',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama produk',
                      suffixIcon: IconButton(
                        onPressed: titleController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              ///Harga
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harga Produk',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Harga produk',
                      suffixIcon: IconButton(
                        onPressed: priceController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              ///Image
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Link Gambar Produk',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: imageController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Link gambar produk',
                      suffixIcon: IconButton(
                        onPressed: imageController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              ///ongkir
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Biaya Ongkir dan Proteksi',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: ongkirController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Biaya ongkir dan layanan',
                      suffixIcon: IconButton(
                        onPressed: ongkirController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),

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
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  CreateOrder(
                      titleController.text.toString(),
                      priceController.text.toString(),
                      imageController.text.toString(),
                      ongkirController.text.toString(),
                  )},
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
                  RejectLink();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text("Tolak")),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
