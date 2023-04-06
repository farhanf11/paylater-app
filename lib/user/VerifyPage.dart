import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Text('Masukan kode OTP'),
            PinCodeFields(
              length: 4,
              fieldBorderStyle: FieldBorderStyle.square,
              responsive: false,
              fieldHeight:40.0,
              fieldWidth: 30.0,
              borderWidth:1.0,
              activeBorderColor: Colors.pink,
              activeBackgroundColor: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(7.0),
              keyboardType: TextInputType.number,
              autoHideKeyboard: false,
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
                child: const Text('Verifikasi'),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NavbarBot())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
