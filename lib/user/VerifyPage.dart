import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:paylater/user/HomePage.dart';

import '../navbar/NavbarBot.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  pushToScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => NavbarBot()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        color: Colors.white,
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/verify.jpg'), width: 250, height: 100,),
            SizedBox(height: 60,),
            Text('SMS Verifikasi telah terkirim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Masukan kode OTP Yang Telah Kami Kirimkan Ke Nomor '),
                  Text(' 08123456789', style: TextStyle(fontWeight: FontWeight.w700),)
                ],
              ),
            ),
            PinCodeFields(
              length: 4,
              fieldBorderStyle: FieldBorderStyle.square,
              responsive: false,
              fieldHeight:50.0,
              fieldWidth: 40.0,
              borderWidth:2.0,
              activeBorderColor: Colors.cyan,
              activeBackgroundColor: Colors.cyan.shade100,
              borderRadius: BorderRadius.circular(7.0),
              keyboardType: TextInputType.number,
              autoHideKeyboard: true,
              fieldBackgroundColor: Colors.black12,
              borderColor: Colors.black38,
              textStyle: TextStyle( color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              onComplete: (output) {
                // Your logic with pin code
                print(output);
              },
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('Submit'),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xFF006A8B))
                ),
                onPressed: () => pushToScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
