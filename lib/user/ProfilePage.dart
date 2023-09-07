import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/profile_page/biodataPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../profile_page/biodata.dart';
import '../profile_page/edit_profile.dart';
import '../profile_page/privacyPolicy.dart';
import '../profile_page/ubah_alamat.dart';
import 'HistoryPage.dart';
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
  var user_name = "username";
  var email_address = "email";
  var phone_number = "phone";
  var image_face = "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250";

  void initState() {
    ProfilebyId();
  }

  ///get data tokken id
  void ProfilebyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    try {
      Response response = await get(
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
            user_name = responseData['data']['user_name'];
            email_address = responseData['data']['email_address'];
            phone_number = responseData['data']['phone_number'];
            image_face = responseData['data']['image_face'];
          });

        }

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
          "Profile",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.maxFinite,
        color: const Color(0xffF6F6F6),
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    Column(
                      children: [
                        Container(
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
                                    image_face,
                                  ))),
                        ),

                        //username
                        Text(
                          user_name.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        //email
                        Text(
                          email_address.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),

                        Text(
                          phone_number.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
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
                        color: Color(0xff025464),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        child: const Text(
                          'Cek Tagihan',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const HistoryPage())),
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
                          MaterialButton(
                            color: Colors.white,
                            child: ButtonProfile(DataButton(
                              id: 1,
                              icon1: Icons.person_pin,
                              text1: 'Edit Profil',
                              text2: 'Kamu bisa memngubah username disini',
                              icon2: Icons.arrow_right_outlined,
                            )),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const EditProfil())),
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          //alamat
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
                          //biodata
                          MaterialButton(
                            color: Colors.white,
                            child: ButtonProfile(DataButton(
                              id: 3,
                              icon1: Icons.playlist_add_circle_sharp,
                              text1: 'Biodata',
                              text2: 'Lengkapi biodata sebelum melakukan pesanan',
                              icon2: Icons.arrow_right_outlined,
                            )),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const BiodataPage())),
                          ),
                          //end biodata

                          const SizedBox(height: 4,),

                          //widget bantuan
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
                          //bantuan
                          MaterialButton(
                              color: Colors.white,
                              child: ButtonProfile(DataButton(
                                id: 5,
                                icon1: Icons.help,
                                text1: 'Pusat Bantuan',
                                text2: 'Dapatkan jawaban terbaik dari hal yang ingin kamu tanyakan',
                                icon2: Icons.arrow_right_outlined,
                              )),
                              onPressed: () => {}
                          ),
                          //end Bantuan
                          SizedBox(height: 4,),

                          //terms condition
                          MaterialButton(
                            color: Colors.white,
                            child: ButtonProfile(DataButton(
                              id: 6,
                              icon1: Icons.perm_device_info_outlined,
                              text1: 'Syarat dan Ketentuan',
                              text2: 'Syarat dan ketentuan Ilkompay',
                              icon2: Icons.arrow_right_outlined,
                            )),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => Biodata())),
                          ),
                          //end terms condition
                          SizedBox(height: 4,),
                          //privacy policy
                          MaterialButton(
                            color: Colors.white,
                            child: ButtonProfile(DataButton(
                              id: 7,
                              icon1: Icons.privacy_tip,
                              text1: 'Kebijakan Privasi',
                              text2: 'Kebijakan Privasi ILKOMPAY',
                              icon2: Icons.arrow_right_outlined,
                            )),
                            onPressed: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const PrivacyPolicy())),
                          ),
                          //end bantuan
                        ],
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 60,
                ),

                //logout
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color(0xff025464),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Keluar',
                        style: TextStyle(
                            color: Color(0xff025464),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

