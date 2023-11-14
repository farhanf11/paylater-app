import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';
import 'DetailPembayaranCicilan.dart';


class RincianBayarCicilan extends StatefulWidget {
  const RincianBayarCicilan({Key? key, required this.order_id, required this.user_id}) : super(key: key);

  final int order_id;
  final int user_id;
  @override
  State<RincianBayarCicilan> createState() => _RincianBayarCicilanState();
}

class _RincianBayarCicilanState extends State<RincianBayarCicilan> {
  _RincianBayarCicilanState();
  String token = "";
  List datas = [];
  var id = 0.obs;

  var id_installment = 0.obs;
  var order_id = 0.obs;
  var instalment_unique_id = "6";
  var instalment_number = "".obs;
  var instalment_price = 0.obs;
  var status_installment = "approve".obs;
  var due_date = "".obs;
  bool isLoading = false;
  List cicilans = [];

  void initState() {
    super.initState();
    getToken();
    GetOrderData();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  final TextEditingController inputDate = TextEditingController();
  final TextEditingController inputID = TextEditingController();

  void GetOrderData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
    try {
      var response = await get(
        Uri.parse('https://paylater.harysusilo.my.id/api/get-order-detail?user_id=${widget.user_id}&order_id=${widget.order_id}'),
        headers: {
          'Authorization': token,
        },);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        cicilans =  responseData['data']['instalment'];
        print(cicilans);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          id_installment.value = responseData['data']['instalment']['id_installment'];
          order_id.value = responseData['data']['instalment']['order_id'];
          instalment_unique_id = responseData['data']['instalment']['instalment_unique_id'];
          instalment_number.value = responseData['data']['instalment']['instalment_number'];
          instalment_price.value = responseData['data']['instalment']['instalment_price'];
          status_installment.value = responseData['data']['instalment']['status_installment'];
          due_date.value = responseData['data']['instalment']['due_date'];
        }
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
    return ///Rincian Cicilan
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
            ///Head
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        style: BorderStyle.solid,
                        color: Color(0xffE3E9EB))),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rincian Cicilan Pembayaran',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            ///isi
            Flexible(
                fit: FlexFit.tight,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Cicilan',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            cicilans[index]['instalment_price'].toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const BackButton()),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: PaylaterTheme.maincolor),
                                child: const Text(
                                  'lihat',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                    );
                  },
                )
            )
          ],
        ),
      );
  }
}