import 'package:flutter/material.dart';
import 'package:paylater/user/HomePage.dart';
import 'package:paylater/user/ProfilePage.dart';

class UbahAlamat extends StatefulWidget {
  const UbahAlamat({Key? key}) : super(key: key);

  @override
  State<UbahAlamat> createState() => _UbahAlamatState();
}

class _UbahAlamatState extends State<UbahAlamat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text('Change Shipping Address', style: TextStyle(fontSize: 14,)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        color: Color(0xffF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Username
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alamat Pengiriman Baru', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                ),),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff025464))),
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Alamat Baru',
                  ),
                ),
              ],
            ),

            //submit
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
              ),
              child: Text('Submit', style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage())),
            ),
          ],
        ),
      ),
    );
  }
}