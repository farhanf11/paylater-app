import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../admin/component/popup.dart';
import '../theme.dart';

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
        backgroundColor: Color(0xff025464),
        title: Text('Biodata Diri', style: TextStyle(fontSize: 14),),
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
      body: Container( padding: EdgeInsets.all(20),
        color: Color(0xffF6F6F6),
        child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10,),
                  //Nama Lengkap
                  const Text('Nama Lengkap', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Lengkap',
                    ),
                  ),
                  SizedBox(height: 10,),

                  //NIK
                  Text('NIK', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'NIK',
                    ),
                  ),
                  //End NIK
                  SizedBox(height: 10,),

                  //tanggal Lahir
                  Text('Tanggal Lahir', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
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
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pekerjaan',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Nama Ibu Kandung', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nama Ibu Kandung',
                    ),
                  ),
                  //End ibu kandung

                  SizedBox(height: 10,),

                  //Provinsi
                  const Text('Provinsi', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Provinsi',
                    ),
                  ),

                  SizedBox(height: 10,),

                  //Kota
                  Text('Kota', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Kota',
                    ),
                  ),
                  //End Kota

                  SizedBox(height: 10,),

                  //Alamat Lengkap
                  Text('Alamat Lengkap (untuk pengiriman)', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Alamat Lengkap',
                    ),
                  ),
                  //End Alamat Lengkap
                ],
              ), SizedBox(height:60),
              //submit
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PaylaterTheme.maincolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Popup.confirmDialog(context,
                          message: "Simpan Perubahan?",
                          dialogCallback: (value) async {
                            if (value == 'Ya') {
                              Navigator.of(context).pop();
                            }
                            if (value == 'Tidak') {}
                          });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Simpan")),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PaylaterTheme.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Batal")),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}