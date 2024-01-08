import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
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
  var user_name = "".obs;
  var email_address = "".obs;
  var phone_number = "".obs;
  var image_face = "".obs;
  var address = "".obs;
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
    token = prefs.getString('token')!;
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
        print(responseData['data']['image_face']);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            role.value = responseData['data']['role'];
            user_name.value = responseData['data']['user_name'];
            email_address.value = responseData['data']['email_address'];
            phone_number.value = responseData['data']['phone_number'];
            address.value = responseData['data']['address'];
            image_face.value = responseData['data']['image_face'];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
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
      ),
      body: Container(
        height: double.maxFinite,
        color: const Color(0xffF6F6F6),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            ///style
            color: Colors.grey,
          ):ListView(physics: const ClampingScrollPhysics(), children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ///isi
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
                    const SizedBox(height: 15,),

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

                    const SizedBox(height: 5,),
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
                  height: 15,
                ),

                ///button cek link
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: 240,
                  decoration: BoxDecoration(
                    color: role.value == 'pengawas'?PaylaterTheme.light_grey:const Color(0xff025464),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: role.value == 'pengawas'?null:() => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LinkCustomer())
                    ),
                    child: Text(
                      'Cek Pengajuan Link',
                      style: TextStyle(
                          color: role.value == 'pengawas'?PaylaterTheme.grey:Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
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

                      ///alamat
                      MaterialButton(
                        color: Colors.white,
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => const UbahAlamat())),
                        child: ButtonProfile(DataButton(
                          id: 2,
                          icon1: Icons.add_home,
                          text1: 'Edit Alamat Pengiriman',
                          text2: 'Edit alamat pengiriman kamu',
                          icon2: Icons.arrow_right_outlined,
                        )),
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
                ),

                const SizedBox(
                  height: 40,
                ),

                ///logout
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 60)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
                  ),
                  onPressed: role.value == 'pengawas'?() => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AdminNavbarBot())
                  )
                      :
                      () => {
                    PostLogout(),
                  },
                  child: Text(
                    role.value == 'pengawas'
                        ''?"Halaman Admin":'Logout',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

