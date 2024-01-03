import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/AdminNavbarBot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';
import '../../user/TransferBank.dart';

class DetailPembayaranCicilan extends StatefulWidget {
  DetailPembayaranCicilan({Key? key,
    required this.order_id,
    required this.instalment_id}) : super(key: key);

  final int order_id;
  final int instalment_id;

  @override
  State<DetailPembayaranCicilan> createState() => _DetailPembayaranCicilanState();
}

class _DetailPembayaranCicilanState extends State<DetailPembayaranCicilan> {
  var tenor = "".obs;
  var id = 0.obs;
  var order_id = 0.obs;
  var instalment_unique_id = "".obs;
  var instalment_number = "3".obs;
  var instalment_price = 0.obs;
  var status = "".obs;
  var payment_img = "".obs;
  var payment_date = "".obs;
  var payment_status = "".obs;
  var interest_per_month = 0.obs;
  String token = "";
  bool isLoading = false;

  void initState() {
    super.initState();
    getToken();
    GetCicilanData();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  void GetCicilanData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      isLoading = true;
    });
    try {
      var response = await get(
        Uri.parse(
            'https://paylater.harysusilo.my.id/api/get-instalment-detail/2?instalment_id=${widget.instalment_id}&order_id=${widget.order_id}'),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print('data cicilan: '+ responseData['data']['instalment_number']);
        print('data cicilan: '+ responseData['data']['instalment_unique_id']);
        print('price: '+ responseData['data']['instalment_price'].toString());
        print('status: '+ responseData['data']['status']);
        print('payment_img: '+ responseData['data']['payment_img']);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          setState(() {
            instalment_unique_id.value = responseData['data']['instalment_unique_id'];
            instalment_number.value = responseData['data']['instalment_number'];
            id.value = responseData['data']['id'];
            order_id.value = responseData['data']['order_id'];
            tenor.value = responseData['data']['tenor'];
            payment_img.value = responseData['data']['payment_img'];
            instalment_price.value = responseData['data']['instalment_price'];
            status.value = responseData['data']['status'];
            interest_per_month.value = responseData['data']['interest_per_month'];
            payment_status.value = responseData['data']['payment_status']??"belum bayar";
            payment_date.value = responseData['data']['payment_date'];
          });
        }
      } else {
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  void VerifyInstalment(var id, var order_id, String is_approve) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/approval-instalment'),
          headers: {
            'Authorization': token,
          },
          body: {
            'order_id': order_id,
            'instalment_id': id,
            'is_approve': is_approve,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.pop(context);
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context as BuildContext).pop(),
              ),
            ],
          );

          showDialog(context: context as BuildContext, builder: (context) => alert);
        }

      }
      else {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          content: const Text('Tidak sesuai'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context as BuildContext).pop(),
            ),
          ],
        );
        showDialog(context: context as BuildContext, builder: (context) => alert);
      }
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(seconds: 2),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff025464),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            "Detail Pembayaran",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          color: const Color(0xffE3E9EB),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
              ///style
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ):ListView(physics: const ClampingScrollPhysics(), children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: PaylaterTheme.white,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                    child: const Text(
                      'Rincian',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: PaylaterTheme.maincolor),
                    ),
                  ),

                  ///Rincian pesanan
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ///ID Pesanan
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(0xffEBEBEB))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'ID',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Obx(() => Text(
                                instalment_unique_id.value,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),)
                            ],
                          ),
                        ),

                        ///Tenor
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(0xffEBEBEB))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tenor Cicilan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                tenor.value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),

                        ///Tagihan Bulanan
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tagihan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Obx(() => Text(
                                interest_per_month.value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),)
                            ],
                          ),
                        ),

                        ///Tagihan Bulanan
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Status Pembayaran',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Obx(() => Text(
                                payment_status.value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),)
                            ],
                          ),
                        ),
                        ///Status Cicilan
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Status Cicilan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Obx(() => Text(
                                status.value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///bukti bayar
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Head
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color(0xffE3E9EB))),
                          ),
                          child: const Text(
                            'Bukti Pembayaran',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),

                        ///bukti
                        Container(
                          height: 360,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Obx(() => Ink.image(
                            image: NetworkImage("${payment_img.value.toString()}")
                          ),)
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14,),

                  ///button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: PaylaterTheme.maincolor,
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          ),

                          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                          child: const Text('Setujui', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        ),
                        onPressed: () {
                          VerifyInstalment(
                              id.value.toString(),
                              order_id.value.toString(),
                              "approve"
                          );
                        },
                      ),

                      MaterialButton(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(6))
                          ),

                          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                          child: const Text('Tolak', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        ),
                        onPressed: () {
                          VerifyInstalment(
                              id.value.toString(),
                              order_id.value.toString(),
                              "reject"
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
