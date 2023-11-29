
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';

class RincianAkad extends StatefulWidget {
  const RincianAkad({Key? key, required this.link_id, required this.user_id, required this.status}) : super(key: key);
  final int link_id;
  final int user_id;
  final String status;

  @override
  State<RincianAkad> createState() => _RincianAkadState();
}

class _RincianAkadState extends State<RincianAkad> {
  var id = 0;
  ///get
  var image = "".obs;
  var title = "".obs;
  var price = 0.obs;
  var order_id = 0.obs;
  var link_id = 0.obs;

  String url = "";
  String token = "";
  String _address = '';
  String _tenor = '';
  var catatan = '';
  var address = ''.obs;
  List order = [];

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

  @override
  void initState() {
    super.initState();
    GetOrderData();
    getToken();
    print('status' + widget.status);
  }


  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      id = prefs.getInt('id')!;
    });
  }

  ///get rincian produk
  void GetOrderData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    try {
      var response = await get(
        Uri.parse('https://paylater.harysusilo.my.id/api/get-link-detail?user_id=${widget.user_id}&link_id=${widget.link_id}'),
        headers: {
          'Authorization': token,
        },);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData['data']['order']['title']);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          title.value = responseData['data']['order']['title'];
          price.value = responseData['data']['order']['price'];
          image.value = responseData['data']['order']['image'];
          order_id.value = responseData['data']['order']['id'];
          link_id.value = responseData['data']['order']['link_id'];
          address.value = responseData['data']['user']['address'];
        }
      }else{
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
  }

  final TextEditingController addressController = TextEditingController();
  final TextEditingController tenorController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  ///post permintaan akad
  void AddOrder(String tenor, String address, String note) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/order-store/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'address': address,
            'tenor': tenor,

            'note': note,
            'order_id': order_id.value.toString(),
            'link_id': link_id.value.toString(),
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
          print('gagal');
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

  String? alamat;
  String? dropdownValue = "Customer";


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Akad'),
        backgroundColor: PaylaterTheme.maincolor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              child: Column(
                children: [
                  Obx(() => Image(
                      width: 100,
                      image: NetworkImage(
                        image.value,
                      ))
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => Text(
                    title.value.toString(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() => Text(
                    'Rp ${price.value}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),)
                ],
              ),
            ),

            ///tenor
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tenor',
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
                  title: const Text('3'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '6',
                    groupValue: _tenor,
                    onChanged: _handleTenor,
                  ),
                  title: const Text('6'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: '12',
                    groupValue: _tenor,
                    onChanged: _handleTenor,
                  ),
                  title: const Text('12'),
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
                  'Alamat',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'unj',
                    groupValue: _address,
                    onChanged: _handleAddress,
                  ),
                  title: const Text('UNJ'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'mandiri',
                    groupValue: _address,
                    onChanged: _handleAddress,
                  ),
                  title: Text(address.toString() + '(alamat sendiri)'),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Catatan',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                const SizedBox(height: 5,),
                TextField(
                  controller: catatanController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff025464))),
                    border: OutlineInputBorder(),
                    hintText: 'Catatan untuk pesanan anda',
                  ),
                ),
              ],
            ),

            if (widget.status == 'request' && widget.status != 'accept')
            SizedBox(height: 60,),

            ///submit
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 4, horizontal: 14)),
                    backgroundColor: widget.status == 'request'?MaterialStatePropertyAll(Colors.grey):MaterialStatePropertyAll(Color(0xff025464)),
                  ),
                  onPressed: widget.status == 'request'?null:() => {
                    AddOrder(
                        _tenor.toString(),
                        _address.toString(),
                        catatanController.text.toString()
                    )
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
      )
    );
  }
}
