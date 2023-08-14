import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  final TextEditingController inputOTP = TextEditingController();

  void login(String email) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/auth/login'),
          body: {'otp_code': inputOTP.text, 'email_address': email});
      if (response.statusCode == 200) {
        print('Otp berhasil dikirim');
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => VerifyPage(
                      email: widget.email,
                    )));
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
