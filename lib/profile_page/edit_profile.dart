import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navbar/NavbarBot.dart';
import '../theme.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  String token = "";
  var id = 0;

  void initState() {
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      id = prefs.getInt('id')!;
    });
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();

  void AddBiodata(String username, String telp ) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/update-biodata/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'username': username,
            'telp': telp,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => NavbarBot()));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      if (response.statusCode == 422) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    telpController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PaylaterTheme.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Mengedit Profil',
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
                      controller: usernameController,
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
                              controller: telpController,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => {
                        AddBiodata(
                            usernameController.text.toString(),
                            telpController.text.toString(),
                        )
                      },
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
                          child: const Text("Batal")),
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