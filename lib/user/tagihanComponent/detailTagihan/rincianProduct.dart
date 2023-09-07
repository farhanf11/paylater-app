import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RincianProduct extends StatefulWidget {
  const RincianProduct({Key? key}) : super(key: key);

  @override
  State<RincianProduct> createState() => _RincianProductState();
}

class _RincianProductState extends State<RincianProduct> {
  List datas = [];
  bool isLoading = false;

  void initState() {
    getTagihanbyID();
  }

  Future<void> getTagihanbyID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    var order_id = prefs.getInt('order_id');
    print(id);
    setState(() {
      isLoading = true;
      token = prefs.getString('token')!;
    });
    try {
      Response response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-order-list?user_id=$id&order_id=$order_id'),
          headers: {
            'Authorization': token,
          });
      inspect(response);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas =  responseData['data']['data'];
        // return Customer(data: datas);
      }else{
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 6),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2))
                    ],
                    shape: BoxShape.rectangle,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://img.freepik.com/free-photo/elegant-smartphone-composition_23-2149437084.jpg?size=626&ext=jpg&ga=GA1.2.208731134.1681022893&semt=ais",
                        ))),
              ),
              SizedBox(height: 16,),
              Text('Nama Produk', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
              Text('12 - 12 - 2022', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
            ],
          ),
        ),

        //Rincian pesanan
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //ID Pesanan
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffEBEBEB))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID Pesanan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('12345678',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),

              //Tenor
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffEBEBEB))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tenor Cicilan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('3 Bulan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),

              //Total Tagihan
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(style: BorderStyle.solid, color: Color(0xffEBEBEB))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Tagihan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('1.500.000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),

              //Tagihan Tersisa
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tagihan Tersisa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text('500.000',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

