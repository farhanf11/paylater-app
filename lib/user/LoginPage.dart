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
          decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.teal.shade800, Colors.orange]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo-depan.png'), width: 60,),
              Text('Login',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 60,),
              //phone number
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: phoneController,
                  autofocus: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
              SizedBox(height: 30,),
              //password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: passwordController,
                  autofocus: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                      hoverColor: Colors.orangeAccent,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(Icons.key),
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),

              SizedBox(height: 40,),

              TextButton(
                child: const Text('Forgot Password', style: TextStyle(
                    color: Color(0xff7bbeff)),
                ),

                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NavbarBot())),
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