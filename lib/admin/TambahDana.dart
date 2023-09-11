import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/admin_keuangan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TambahDana extends StatefulWidget {
  const TambahDana({Key? key}) : super(key: key);

  @override
  State<TambahDana> createState() => _TambahDanaState();
}

class _TambahDanaState extends State<TambahDana> {
  final TextEditingController inputEmail = TextEditingController();

  void login(String amount) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/cash-store'),
          body: {
            'amount': amount,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => AdminKeuangan(),
          ),
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'amount', amount
        );

        AlertDialog alert = AlertDialog(
          title: Text("OTP Telah Dikirim"),
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
      }else {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: const Text('Tambah Dana',
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
                        controller: inputEmail,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Masukkan Jumlah Dana',
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Color(0xff025464))),
                        onPressed: () => {login(inputEmail.text.toString())},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('Selanjutnya'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
