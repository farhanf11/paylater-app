import 'package:flutter/material.dart';
import 'package:paylater/user/HomePage.dart';

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
        backgroundColor: Color(0xff1288B5),
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text('Edit Profil', style: TextStyle(fontSize: 14,)),
        ),
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
        color: Color(0xffF6F6F6),
        child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20,),

                    //Username
                    Text('Alamat Pengiriman Baru', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Alamat Baru',
                      ),
                    ),
                    //End Username

                    SizedBox(height: 10,),

                    SizedBox(height: 30,),
                    //logout
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Color(0xff1288B5),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10,),
                          Text('Simpan',
                            style: TextStyle(
                                color: Color(0xff1288B5),
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