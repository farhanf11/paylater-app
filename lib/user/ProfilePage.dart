import 'package:flutter/material.dart';
import 'package:paylater/profile_page/biodata.dart';
import 'package:paylater/profile_page/edit_profile.dart';
import 'package:paylater/profile_page/ubah_alamat.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HistoryPage.dart';

_sendingMails() async {
  var url = Uri.parse("mailto:fpfusion.77@gmail.com");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        title: Text("Profile", style: TextStyle(fontSize: 16),),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xffF6F6F6),
        child: ListView(
            physics: ClampingScrollPhysics(),
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20,),

                  //foto profile
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                            ))),
                  ),

                  //username
                  Text('Customer123', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500,
                  ),),

                  //email
                  Text('Customer@mail.com', style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),),
                  SizedBox(height: 20,),

                  //button cek tagihan
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,),
                    padding: EdgeInsets.symmetric(vertical: 6),
                    width: 240,
                    decoration: BoxDecoration(
                      color: Color(0xff025464),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      child: const Text('Cek Tagihan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => HistoryPage())),
                    ),
                  ),

                  //widget edit profile
                  SizedBox(height: 20,),
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
                  //end FAQ
                  SizedBox(height: 40,),

                  //logout
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Color(0xff025464),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10,),
                        Text('Logout',
                          style: TextStyle(
                              color: Color(0xff025464),
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}