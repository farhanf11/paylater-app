import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00ab9c),
        title: Text('Profile Page'),
      ),
      body: Container(
        color: Color(0xffF6F6F6),
        child: ListView(
            physics: ClampingScrollPhysics(),
          children: [
            Column(
              children: [
                //bagian atas
                Container(
                  height: 90,
                  color: Colors.white,
                ),
                SizedBox(height: 10,),

                //limit
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Color(0xff00ab9c),
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('left',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      Text('right',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 160,
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.perm_identity_outlined),
                                SizedBox(width: 10,),
                                Text('Profil',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.paste_outlined),
                                SizedBox(width: 10,),
                                Text('Data Diri',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.password),
                                SizedBox(width: 10,),
                                Text('Ubah Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 160,
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.perm_identity_outlined),
                                SizedBox(width: 10,),
                                Text('Profil',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffbdbdbd))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.paste_outlined),
                                SizedBox(width: 10,),
                                Text('Data Diri',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                //logout
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Color(0xff00ab9c)
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 10,),
                      Text('Logout',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Icon(Icons.logout),
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}