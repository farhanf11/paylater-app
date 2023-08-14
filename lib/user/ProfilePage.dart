// import 'package:js/js.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/components/profileComponent/menuProfile.dart';
import 'package:paylater/components/profileComponent/profileInfo.dart';
import 'HistoryPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.maxFinite,
        color: Color(0xffF6F6F6),
        child: ListView(physics: ClampingScrollPhysics(), children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    ProfileInfo(),
                    SizedBox(
                      height: 20,
                    ),

                    //button cek tagihan
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

                    //widget menu profile
                    const MenuProfile(),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
