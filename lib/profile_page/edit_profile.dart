import 'package:flutter/material.dart';
import 'package:paylater/user/HomePage.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1288B5),
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text('Edit Profil', style: TextStyle(fontSize: 14,)),
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
                    Text('Username', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                    ),
                    //End Username
                    SizedBox(height: 10,),

                    //Email
                    Text('Email', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    //End Email

                    SizedBox(height: 10,),

                    //Nomor Telepon
                    Text('Nomor Telepon', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nomor Telepon',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
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
                    SizedBox(height: 30,)
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}