import 'package:flutter/material.dart';
import 'package:paylater/user/VerifyPage.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  TextEditingController phoneController = TextEditingController();

  @override

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Daftar/Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                // controller: _emailController,
                // validator: validateEmail,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  hintText: "08XXXXXXXXX",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Register Here",
                      style: TextStyle(
                          color: Colors.purple[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
                child: ElevatedButton(
                  child: const Text('Lanjutkan'),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => VerifyPage())),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}