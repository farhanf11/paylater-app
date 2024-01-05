import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';


class PostPengajuanProduk extends StatefulWidget {
  const PostPengajuanProduk({Key? key, required this.link_id, required this.user_id}) : super(key: key);

  final int link_id;
  final int user_id;

  @override
  State<PostPengajuanProduk> createState() => _PostPengajuanProdukState();
}

class _PostPengajuanProdukState extends State<PostPengajuanProduk> {
  String token = "";
  var user_id = 0;
  var link_id = 0;

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
  final TextEditingController noteController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController linkIdController = TextEditingController();

  void CreateOrder(String title, String price, String image,
      String note, String url, String link_id) async {
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
            'note': note,
            'url': url,
            'link_id': link_id,
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
      if (response.statusCode == 422) {
        var responseData = json.decode(response.body);
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

              ///Provinsi
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pesan',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Pesan kepada customer',
                      suffixIcon: IconButton(
                        onPressed: noteController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              ),


              const SizedBox(
                height: 24,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Url Produk',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Url produk dari marketplace',
                      suffixIcon: IconButton(
                        onPressed: urlController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Link ID',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: linkIdController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'id',
                      suffixIcon: IconButton(
                        onPressed: linkIdController.clear,
                        icon: const Icon(Icons.clear, size: 16),
                      ),
                    ),
                  ),
                ],
              )
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
                      noteController.text.toString(),
                      urlController.text.toString(),
                      linkIdController.text.toString())
                },
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
        ]),
      ),
    );
  }
}
