import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/user/VerifyPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  final TextEditingController inputEmail = TextEditingController();

  void login(String email) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/auth/send-otp-code'),
          body: {
            'email_address': email,
          });
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => VerifyPage(
                      email: email,
                    )));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);

        AlertDialog alert = AlertDialog(
          title: Text("OTP Telah Dikirim"),
          content: Container(
            child: Text("Berhasil mengirimkan kode OTP ke email" + " " + email),
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
      if (response.statusCode == 422) {
        AlertDialog alert = AlertDialog(
          title: Text("Isi format email dengan benar"),
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
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: const Text('Login',
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
                          labelText: 'Masukkan Email Anda',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              // This is where we update the state when the checkbox is tapped
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        SizedBox(width: 10),
                        const Text(
                          'Saya menyetujui Persyaratan Layanan dan \n Kebijakan Privasi',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
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
                )
              ],
            ),
          )),
    );
  }
}
