import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';

class AdminVerifyPage extends StatefulWidget {
  const AdminVerifyPage({Key? key}) : super(key: key);

  @override
  State<AdminVerifyPage> createState() => _AdminVerifyPageState();
}

class _AdminVerifyPageState extends State<AdminVerifyPage> {
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  // inisial coockies email
  // get coockies
  // if ( email == "admin@gmail.com"){
  //  navigate(/adminVerify)
  // } else {
  //   navigate(/verifyPage)
  // }

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
        backgroundColor: const Color(0xff025464),
        leading: const BackButton(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //text header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OTP Telah Dikirim',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //text 2
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Masukan Kode OTP Yang Telah Dikirimkan Melalui Pesan Email ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Monsterat'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
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
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (output) {
                    // Your logic with pin code
                    print(output);
                  },
                ),
                const SizedBox(height: 12),
                const SizedBox(
                  height: 10,
                ),

                //kirim ulang button
                TextButton(
                  onPressed: () => const AdminVerifyPage(),
                  child: const Text(
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
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Color(0xff025464))),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AdminNavbarBot())),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('Selanjutnya'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
