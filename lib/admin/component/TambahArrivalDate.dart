import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/RincianCicilanAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class TambahArrivalDate extends StatefulWidget {
  const TambahArrivalDate({Key? key, required this.order_id}) : super(key: key);

  final String order_id;
  @override
  State<TambahArrivalDate> createState() => _TambahArrivalDateState();
}

class _TambahArrivalDateState extends State<TambahArrivalDate> {
  _TambahArrivalDateState();
  String token = "";
  String order_id = "";

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  final TextEditingController inputDate = TextEditingController();

  ///date
  @override
  void dispose() {
    inputDate.dispose();
    super.dispose();
  }

  void AddDate(var order_id, String arrivalDate) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/arrivaldate-store'),
          headers: {
            'Authorization': token,
          },
          body: {
            'order_id': widget.order_id,
            'arrival_date': arrivalDate,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          if (kDebugMode) {
            print('gagal');
          }
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => RincianCicilanAdmin(order_id: 0, user_id: 0,)));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }

      }
      else {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text('Tambah Tanggal Sampai',
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center),
      ),
      body: Container(
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        readOnly: true,
                        controller: inputDate,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Tanggal Lahir',
                        ),
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2050));
                          if (date != null) {
                            inputDate.text = DateFormat('dd/mm/yyyy').format(date);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Color(0xff025464))),
                  onPressed: () => {AddDate(
                    order_id.toString(),
                    inputDate.text.toString()
                  )},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text('Selanjutnya'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
