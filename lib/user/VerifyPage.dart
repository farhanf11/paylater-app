import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:paylater/navbar/NavbarBot.dart';

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
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        leading: BackButton(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 90, horizontal: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //text header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OTP Telah Dikirim',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                //text 2
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masukan kode OTP Yang Telah Kami Kirimkan Ke Nomor ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monsterat'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '08123xxxxxx',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 72,
                ),

                //field otp
                PinCodeFields(
                  length: 6,
                  fieldBorderStyle: FieldBorderStyle.square,
                  responsive: true,
                  fieldHeight: 50.0,
                  fieldWidth: 30.0,
                  borderWidth: 2.0,
                  activeBorderColor: Colors.cyan,
                  activeBackgroundColor: Colors.cyan.shade100,
                  borderRadius: BorderRadius.circular(7.0),
                  keyboardType: TextInputType.number,
                  autoHideKeyboard: true,
                  fieldBackgroundColor: Colors.black12,
                  borderColor: Colors.black38,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    print(output);
                  },
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text('OTP Berlaku hingga '),
                    Text(
                      '49',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(' lagi'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                //kirim ulang button
                TextButton(
                  onPressed: () => VerifyPage(),
                  child: Text(
                    'Kirim Ulang',
                    style: TextStyle(fontSize: 16, color: Color(0xff025464)),
                  ),
                ),
              ],
            ),

            //button
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('Selanjutnya'),
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xff025464))),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => NavbarBot())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
