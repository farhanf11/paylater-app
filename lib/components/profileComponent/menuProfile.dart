import 'package:flutter/material.dart';
import 'package:paylater/profile_page/biodata.dart';
import 'package:paylater/profile_page/edit_profile.dart';
import 'package:paylater/profile_page/ubah_alamat.dart';
import 'package:url_launcher/url_launcher.dart';

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

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  style: BorderStyle.solid,
                  color: Color(0xff9d9d9d)
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //edit profil
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text('Edit Profile',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => EditProfil())),
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        // the method which is called
                        // when button is pressed
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => EditProfil(),
                        )
                        )),
                  ],
                ),
              ),

              //alamat
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Alamat Pengiriman',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        // the method which is called
                        // when button is pressed
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => UbahAlamat(),
                        )
                        )),
                  ],
                ),
              ),

              //biodata
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Biodata',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        // the method which is called
                        // when button is pressed
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Biodata(),
                        )
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40,),

        //widget bantuan
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(
                  style: BorderStyle.solid,
                  color: Color(0xff9d9d9d)
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //Pesan Email
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: _sendingMails,
                          style: ButtonStyle(
                            padding:
                            MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.black),
                            ),
                          ),
                          child: const Text('Send Email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.navigate_next,
                      ),
                      // the method which is called
                      // when button is pressed
                      onPressed: _sendingMails,
                    ),
                  ],
                ),
              ),
              //end Pesan Email

              //bantuan
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Bantuan',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        // the method which is called
                        // when button is pressed
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => EditProfil(),
                        )
                        )),
                  ],
                ),
              ),
              //end Bantuan

              //FAQ
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('FAQ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.navigate_next,
                        ),
                        // the method which is called
                        // when button is pressed
                        onPressed: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Biodata(),
                        )
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        //end bantuan
      ],
    );
  }
}
