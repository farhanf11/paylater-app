import 'package:flutter/material.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/user/ProfilePage.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        color: Color(0xffF6F6F6),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  //Username
                  Text('Username', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey
                  ),),
                  SizedBox(height: 5,),
                  TextField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Username',
                    ),
                  ),
                  //End Username
                  SizedBox(height: 24),

                  //Email
                  Text('Email', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                  ),),
                  SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Email',

                    ),
                  ),
                  //End Email

                  SizedBox(height: 24,),

                  //Nomor Telepon
                  Text('Nomor Telepon', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                  ),),
                  SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Nomor Telepon',
                    ),
                  ),
                ],
              ),
              //simpan
              ElevatedButton(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text('Simpan'),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xff025464))
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NavbarBot())),
              ),
            ]
        ),
      ),
    );
  }
}