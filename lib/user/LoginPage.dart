import 'package:flutter/material.dart';
import 'package:paylater/navbar/NavbarBot.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[900],
        body: Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN IN",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  Icons.person_outline,
                ),
                hintText: "Username",
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
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NavbarBot())),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}