import 'package:flutter/material.dart';
import 'package:paylater/profile_page/biodata.dart';
import 'package:paylater/profile_page/edit_profile.dart';
import 'package:paylater/profile_page/privacyPolicy.dart';
import 'package:paylater/profile_page/ubah_alamat.dart';
import 'package:url_launcher/url_launcher.dart';

import 'buttonProfile.dart';
import 'dataButton.dart';

_sendingMails() async {
  var url = Uri.parse("mailto:fpfusion.77@gmail.com");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MenuProfile extends StatelessWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          MaterialButton(
            color: Colors.white,
            child: ButtonProfile(DataButton(
              id: 1,
              icon1: Icons.person_pin,
              text1: 'Edit Profil',
              text2: 'Edit profil kamu agar lebih menarik',
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
              text2: 'Lengkapi biodata sebelum dapat melakukan pesanan',
              icon2: Icons.arrow_right_outlined,
            )),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Biodata())),
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
    );
  }
}
