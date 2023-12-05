import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/profile_page/biodataPage.dart';
import 'package:paylater/profile_page/helpCenter.dart';
import 'package:paylater/theme.dart';
import 'package:paylater/user/LinkCustomer.dart';
import 'package:paylater/user/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../profile_page/ubah_alamat.dart';
import 'components/profileComponent/buttonProfile.dart';
import 'components/profileComponent/dataButton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

_sendingMails() async {
  var url = Uri.parse("mailto:fpfusion.77@gmail.com");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState();
  var user_name = "username".obs;
  var email_address = "email".obs;
  var phone_number = "phone".obs;
  var image_face = "image_face".obs;
  var address = "address".obs;
  String token = "";

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
            address.value = responseData['data']['address'];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff025464),
        title: const Text(
          "Profil",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Container(
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

                      ///username
                      Obx(() => Text(
                        user_name.value,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),),

                      ///email
                      Obx(() => Text(
                        email_address.value,
                        style: const TextStyle(
                          fontSize: 14,
                          color: PaylaterTheme.nearlyDarkBlue,
                          fontWeight: FontWeight.w500
                        ),
                      ),),

                      Obx(() => Text(
                        phone_number.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),),

                      SizedBox(height: 5,),
                      Obx(() => Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        address.value,
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

                  ///button cek tagihan
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    width: 240,
                    decoration: BoxDecoration(
                      color: const Color(0xff025464),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      child: const Text(
                        'Cek Pengajuan Link',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LinkCustomer())),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// data profile
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [

                        ///edit profil
                        // MaterialButton(
                        //   color: Colors.white,
                        //   child: ButtonProfile(DataButton(
                        //     id: 1,
                        //     icon1: Icons.person_pin,
                        //     text1: 'Edit Profil',
                        //     text2: 'Kamu bisa memngubah username disini',
                        //     icon2: Icons.arrow_right_outlined,
                        //   )),
                        //   onPressed: () => Navigator.of(context)
                        //       .push(MaterialPageRoute(builder: (context) => const EditProfil())),
                        // ),
                        //
                        // const SizedBox(
                        //   height: 4,
                        // ),

                        ///alamat
                        MaterialButton(
                          color: Colors.white,
                          child: ButtonProfile(DataButton(
                            id: 2,
                            icon1: Icons.add_home,
                            text1: 'Edit Alamat Pengiriman',
                            text2: 'Edit alamat pengiriman kamu',
                            icon2: Icons.arrow_right_outlined,
                          )),
                          onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const UbahAlamat())),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        ///biodata
                        MaterialButton(
                          color: Colors.white,
                          child: ButtonProfile(DataButton(
                            id: 3,
                            icon1: Icons.playlist_add_circle_sharp,
                            text1: 'Biodata',
                            text2: 'Lengkapi biodata diri kamu',
                            icon2: Icons.arrow_right_outlined,
                          )),
                          onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const BiodataPage())),
                        ),
                        //end biodata

                        const SizedBox(height: 4,),

                        ///email
                        MaterialButton(
                          color: Colors.white,
                          onPressed: _sendingMails,
                          child: ButtonProfile(DataButton(
                            id: 4,
                            icon1: Icons.attach_email,
                            text1: 'Kirim Email',
                            text2: 'Kirim email untuk info selebihnya',
                            icon2: Icons.arrow_right_outlined,
                          )),
                        ),
                        //end Pesan Email
                        SizedBox(height: 4,),

                        ///bantuan
                        MaterialButton(
                            color: Colors.white,
                            child: ButtonProfile(DataButton(
                              id: 5,
                              icon1: Icons.help,
                              text1: 'Pusat Bantuan',
                              text2: 'Pusat bantuan penggunaan aplikasi',
                              icon2: Icons.arrow_right_outlined,
                            )),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const HelpCenter())),
                        ),

                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 60,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () => {
                  PostLogout(),
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

