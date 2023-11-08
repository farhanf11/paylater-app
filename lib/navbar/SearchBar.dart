
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/user/HistoryPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';

class RincianAkad extends StatefulWidget {
  const RincianAkad({Key? key, required this.link_id, required this.user_id}) : super(key: key);
  final int link_id;
  final int user_id;

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
            'tenor': tenor,
            'address': address,
            'note': note,
            'order_id': order_id,
            'link_id': link_id,
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
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              child: Column(
                children: [
                  Obx(() => Image(
                      width: 120,
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
                  Obx(() => Text(
                    'Rp ${price.value}',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
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
                  'Alamat',
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
                  title: const Text('Alamat UNJ'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: address.toString(),
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
                const Text('Catatan', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
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

            const SizedBox(height: 60,),
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
                    AddOrder(
                        _address.toString(),
                        _tenor.toString(),
                        catatanController.text.toString())
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
          ],
        ),
      ),
    );
  }
}
