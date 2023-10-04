import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahResi extends StatefulWidget {
  const TambahResi({Key? key, required this.order_id}) : super(key: key);
  final String order_id;

  @override
  State<TambahResi> createState() => _TambahResiState();
}

class _TambahResiState extends State<TambahResi> {
  _TambahResiState();
  String token = "";
  String order_id = "";

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

  final TextEditingController inputResi = TextEditingController();

  void AddResi(var order_id, String airway_bill) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/airwaybill-store'),
          headers: {
            'Authorization': token,
          },
          body: {
            'order_id': widget.order_id,
            'airway_bill': airway_bill,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
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
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }

      }
      else {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          content: const Text('Kolom resi harus di isi'),
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
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text('Tambah Resi',
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center),
      ),
      body: Container(
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: inputResi,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Masukkan Resi Sesuai dari Marketplace',
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Color(0xff025464))),
                  onPressed: () => {AddResi(
                    order_id.toString(),
                    inputResi.text.toString(),
                  )},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('Selanjutnya'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
