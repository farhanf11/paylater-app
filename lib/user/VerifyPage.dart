import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  _VerifyPageState();
  String email = "";

  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('username')!;
    });
  }

  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  final TextEditingController inputOTP = TextEditingController();

  void login(String email) async {
    print(email);
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/auth/login'),
          body: {
            'otp_code': inputOTP.text,
            'email_address': widget.email,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text("Berhasil Login"),
          content: Text(responseData['message']),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        print(responseData['data']['id']);
        print(responseData['data']['user_name']);

        ///set token login
        ///
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', 'Bearer ' + responseData['token']);
        prefs.setInt('id', responseData['data']['id']);
        prefs.setString('user_name', responseData['data']['user_name']);
        prefs.setString('email_address', responseData['data']['email_address']);
        prefs.setString('job', responseData['data']['job']);

        if(responseData['data']['role'] == "admin" ) {
          showDialog(context: context, builder: (context) => alert);
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => AdminNavbarBot()));
        }else{
          showDialog(context: context, builder: (context) => alert);
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
        }
      } else {
        print('failed');
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
        leading: const BackButton(),
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
                        controller: inputOTP,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Masukkan 6 Kode OTP',
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
                        onPressed: () => {login(inputOTP.text.toString())},
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
