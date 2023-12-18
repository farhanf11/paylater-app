import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/theme.dart';
import 'package:paylater/user/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AkunAdminPengawas extends StatefulWidget {
  const AkunAdminPengawas({Key? key}) : super(key: key);

  @override
  State<AkunAdminPengawas> createState() => _AkunAdminPengawasState();
}

class _AkunAdminPengawasState extends State<AkunAdminPengawas> {
  _AkunAdminPengawasState();
  var user_name = "username".obs;
  var email_address = "email".obs;
  var phone_number = "phone".obs;
  var image_face = "image_face".obs;
  var role = "".obs;
  String token = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    ProfilebyId();
  }

  ///get data tokken id
  void ProfilebyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    setState(() {
      isLoading = true;
    });
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-user-profile/$id'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            user_name.value = responseData['data']['user_name'];
            email_address.value = responseData['data']['email_address'];
            phone_number.value = responseData['data']['phone_number'];
            image_face.value = responseData['data']['image_face'];
            role.value = responseData['data']['role'];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ///logout
  void PostLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/auth/logout'),
          headers: {
            'Authorization': token,
          },
          body: {
            'token': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
          AlertDialog alert = AlertDialog(
            title: const Text("Logout"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
          showDialog(context: context, builder: (context) => alert);
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
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
      } else {}
      if (response.statusCode == 422) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: const Text("Kolom harus di isi dengan link produk yang benar"),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        print(responseData['data']);
        showDialog(context: context, builder: (context) => alert);
      }
      if (response.statusCode == 404) {
        AlertDialog alert = AlertDialog(
          title: const Text("Email tidak terdaftar"),
          content: const Text("Email yang anda masukan salah"),
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
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.maxFinite,
        color: const Color(0xffF6F6F6),
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ///isi
              Column(
                children: [
                  Column(
                    children: [
                      Obx(() => Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  image_face.value,
                                ))),
                      ),),

                      const SizedBox(
                        height: 14,
                      ),

                      ///username
                      Obx(() => Text(
                        user_name.value,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),),

                      ///email
                      Obx(() => Text(
                        email_address.value,
                        style: const TextStyle(
                            fontSize: 16,
                            color: PaylaterTheme.nearlyDarkBlue,
                            fontWeight: FontWeight.w500
                        ),
                      ),),

                      SizedBox(height: 5,),
                      Obx(() => Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        role.value,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///menu
                ],
              ),

              ///logout
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 4, horizontal: 80)),
                  backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () => {
                  PostLogout(),
                },
              ),

              ///pengawas ke home
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 4, horizontal: 50)),
                  backgroundColor: MaterialStatePropertyAll(PaylaterTheme.grey),
                ),
                child: const Text(
                  'Lihat halaman user',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const NavbarBot(),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 10,
              )
            ],
          ),
        ]),
      ),
    );
  }
}

