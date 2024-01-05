import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/user/DaftarPage.dart';
import 'package:paylater/user/VerifyPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  final TextEditingController inputEmail = TextEditingController();

  void login(String email) async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/auth/send-otp-code'),
          body: {
            'email_address': email,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        isLoading = true;
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => VerifyPage(
                    email: email,
                  )),
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);

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
      } else {
        AlertDialog alert = AlertDialog(
          title: const Text("Kolom email harus di isi dengan benar"),
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
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton.icon(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 48, vertical: 2))
                      ),
                      onPressed: isLoading
                          ? null
                          : () => {login(inputEmail.text.toString())},
                      icon: isLoading
                          ? Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : const Icon(Icons.login),
                      label: const Text('Verifikasi OTP'),
                    ),

                    ///daftar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum memiliki akun?'),
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DaftarPage()),
                                ),
                            child: const Text(
                              'Daftar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
