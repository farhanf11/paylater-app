import 'package:flutter/material.dart';
import 'package:paylater/user/LoginPage.dart';
import '../admin/component/popup.dart';
import '../theme.dart';

class DetailAkun extends StatefulWidget {
  const DetailAkun({Key? key}) : super(key: key);

  @override
  State<DetailAkun> createState() => _DetailAkunState();
}

class _DetailAkunState extends State<DetailAkun> {
  TextEditingController inputnama = TextEditingController();
  TextEditingController inputtelp = TextEditingController();
  TextEditingController inputemail = TextEditingController();
  String? dropdownValue = "Tenaga Pendidik";

  get firstCamera => null;

  @override
  void dispose() {
    inputnama.dispose();
    inputtelp.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaylaterTheme.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Detail Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: PaylaterTheme.darkText,
              )),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: PaylaterTheme.darkText,
              size: 20,
            )),
      ),
      body: Container(
        color: PaylaterTheme.spacer,
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Username
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: inputnama,
                          enabled: false,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              hintText: 'User satu',
                              hintStyle:
                              TextStyle(color: PaylaterTheme.deactivatedText),
                              filled: true,
                              fillColor: PaylaterTheme.white),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    //End Username
                    SizedBox(
                      height: 20,
                    ),

                    //email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          enabled: false,
                          controller: inputemail,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              hintText: 'user123@gmail.com',
                              hintStyle:
                              TextStyle(color: PaylaterTheme.deactivatedText),
                              filled: true,
                              fillColor: PaylaterTheme.white),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Nomor Telepon
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nomor Telepon',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Flexible(
                              flex: 2,
                              child: TextField(
                                enabled: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(),
                                    labelText: '62',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    filled: true,
                                    fillColor: PaylaterTheme.white),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              flex: 8,
                              fit: FlexFit.tight,
                              child: SizedBox(
                                width: double.infinity,
                                child: TextField(
                                  enabled: false,
                                  controller: inputtelp,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      hintText: '812345678',
                                      hintStyle: TextStyle(
                                          color: PaylaterTheme.deactivatedText),
                                      filled: true,
                                      fillColor: PaylaterTheme.white),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Pekerjaan
                    Column
                      (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Status Pekerjaan',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          enabled: false,
                          controller: inputtelp,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))),
                              hintText: 'Dosen',
                              hintStyle: TextStyle(
                                  color: PaylaterTheme.deactivatedText),
                              filled: true,
                              fillColor: PaylaterTheme.white),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //verif wajah
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Verifikasi Wajah',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            image: const DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/man-face-close-up_98292-4059.jpg?size=626&ext=jpg&ga=GA1.2.901965733.1670248694&semt=ais'))
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //verif ktp
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Verifikasi Kartu Identitas (KTP)',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PaylaterTheme.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              image: const DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/organic-flat-about-me-landing-page_23-2148899204.jpg?w=1380&t=st=1689579056~exp=1689579656~hmac=8590acdddc0156c05c22df6dd7ca560b91ac49ab42baa68f0c2ac9bfe77582de'))
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                //button
                SizedBox(
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PaylaterTheme.maincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Popup.confirmDialog(context,
                            message: "Yakin Verifikasi Akun?",
                            dialogCallback: (value) async {
                              if (value == 'confirm') {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                              if (value == 'cancel') {}
                            });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Verifikasi Akun")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PaylaterTheme.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Tolak")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
