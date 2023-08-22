import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UbahAlamat extends StatefulWidget {
  const UbahAlamat({Key? key}) : super(key: key);

  @override
  State<UbahAlamat> createState() => _UbahAlamatState();
}

class _UbahAlamatState extends State<UbahAlamat> {
  String token = "";
  var id = 0;

  void initState() {
    getToken();

  }
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      id = prefs.getInt('id')!;
    });
  }

  final TextEditingController inputAddress = TextEditingController();

  void EditAddress(String address) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/update-address/$id'),
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
                  builder: (BuildContext context) => NavbarBot()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        title:  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text('Change Shipping Address', style: TextStyle(fontSize: 14,)),
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
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        color: Color(0xffF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Username
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Alamat Pengiriman Baru', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                ),),
                SizedBox(height: 5,),
                TextField(
                  controller: inputAddress,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff025464))),
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Alamat Baru',
                  ),
                ),
              ],
            ),

            //submit
            ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
              ),
              child: Text('Submit', style: TextStyle(color: Colors.white),),
              onPressed: () => {EditAddress(inputAddress.text.toString())},
            ),
          ],
        ),
      ),
    );
  }
}