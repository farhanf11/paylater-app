import 'package:flutter/material.dart';
import 'package:paylater/user/HomePage.dart';
import 'package:intl/intl.dart';

class Biodata extends StatefulWidget {
  const Biodata({Key? key}) : super(key: key);

  @override
  State<Biodata> createState() => _BiodataState();
}

class _BiodataState extends State<Biodata> {
  final dateController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1288B5),
        title: Text('Melengkapi Biodata', style: TextStyle(fontSize: 14),),
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
                    //Nama Lengkap
                    Text('Nama Lengkap', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nama Lengkap',
                      ),
                    ),
                    SizedBox(height: 10,),

                    //NIK
                    Text('NIK', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'NIK',
                      ),
                    ),
                    //End NIK
                    SizedBox(height: 10,),

                    //tanggal Lahir
                    Text('Tanggal Lahir', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                  TextField(
                    readOnly: true,
                    controller: dateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Tanggal Lahir',
                    ),
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        dateController.text = DateFormat('MM/dd/yyyy').format(date);
                      }
                    },
                  ),
                  //end tanggal lahir

                    SizedBox(height: 10,),
                    Text('Pekerjaan', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pekerjaan',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Nama Ibu Kandung', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nama Ibu Kandung',
                      ),
                    ),
                    //End ibu kandung

                    SizedBox(height: 10,),

                    //Provinsi
                    Text('Profinsi', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Provinsi',
                      ),
                    ),

                    SizedBox(height: 10,),

                    //Kota
                    Text('Kota', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Kota',
                      ),
                    ),
                    //End Kota

                    SizedBox(height: 10,),

                    //End Kode Pos
                    Text('Kode Pos', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Kode Pos',
                      ),
                    ),
                  //  End Kode Pos

                    SizedBox(height: 10,),

                    //Alamat Lengkap
                    Text('Alamat Lengkap (untuk pengiriman)', style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey
                    ),),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Alamat Lengkap',
                      ),
                    ),
                    //End Alamat Lengkap


                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}