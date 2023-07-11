import 'package:flutter/material.dart';
import 'package:paylater/user/HomePage.dart';

import '../admin/component/popup.dart';
import '../theme.dart';
import '../user/ProfilePage.dart';
import '../user/VerifyPage.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);


  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  TextEditingController inputnama = TextEditingController();
  TextEditingController inputtelp = TextEditingController();

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
          child: Text('Mengedit Akun',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: PaylaterTheme.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      // selectionHeightStyle:
                      //     BoxHeightStyle.includeLineSpacingMiddle,
                      controller: inputnama,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          hintText: 'Masukan Username',
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
                    //End Username
                    SizedBox(
                      height: 20,
                    ),

                    //Nomor Telepon
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
                                labelText: '+62',
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
                              controller: inputtelp,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  hintText: 'Masukan Nomor Telepon',
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
                    //End Nomor Telepon
                  ],
                ),
                SizedBox(height: 200,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PaylaterTheme.maincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Popup.confirmDialog(context,
                            message: "Simpan Perubahan?",
                            dialogCallback: (value) async {
                              if (value == 'Ya') {
                                Navigator.of(context).pop();
                              }
                              if (value == 'Tidak') {}
                            });
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Simpan")),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PaylaterTheme.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Batal")),
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