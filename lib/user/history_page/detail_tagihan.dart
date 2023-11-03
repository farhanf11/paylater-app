import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/DetailPembayaranCicilan.dart';
import 'package:paylater/admin/component/RincianBayarCicilan.dart';
import 'package:paylater/admin/component/popup.dart';
import 'package:paylater/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../user/TransferBank.dart';
import 'package:get/get.dart';

class RincianTagihan extends StatefulWidget {
  const RincianTagihan({Key? key, required this.order_id, required this.user_id}) : super(key: key);
  final int order_id;
  final int user_id;

  @override
  State<RincianTagihan> createState() => _RincianTagihanState();
}

class _RincianTagihanState extends State<RincianTagihan> {
  _RincianTagihanState();
  String token = "";
  var id = 0.obs;
  var no_order = 'no_order'.obs;
  var airway_bill = 'airway_bill'.obs;
  var user_id = 0.obs;
  var price = 0.obs;
  var image = 'image'.obs;
  var url = 'url'.obs;
  var title = 'titleeee'.obs;
  var total_price = 0.obs;
  var tenor = 'tenor'.obs;
  var address = 'addressoooo'.obs;
  var note = 'note'.obs;
  var arrival_date = 'arrival_date'.obs;
  var request_date = 'request_date'.obs;
  var status = 'status'.obs;
  var created_at = 'created_at'.obs;

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
        print(cicilans.length);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          id.value = responseData['data']['id'];
          no_order.value = responseData['data']['no_order'];
          title.value = responseData['data']['title'];
          image.value = responseData['data']['image'];
          price.value = responseData['data']['price'];
          tenor.value = responseData['data']['tenor'];
          address.value = responseData['data']['address'];
          user_id.value = responseData['data']['user_id'];
          airway_bill.value = responseData['data']['airway_bill'];
          url.value = responseData['data']['url'];
          total_price.value = responseData['data']['total_price'];
          note.value = responseData['data']['note'];
          address.value = responseData['data']['address'];
          arrival_date.value = responseData['data']['arrival_date'];
          request_date.value = responseData['data']['request_date'];
          created_at.value = responseData['data']['created_at'];
          status.value = responseData['data']['status'];

          id_installment.value = responseData['data']['instalment'][0]['id_installment'];
          order_id.value = responseData['data']['instalment'][0]['order_id'];
          instalment_unique_id = responseData['data']['instalment'][0]['instalment_unique_id'];
          instalment_number.value = responseData['data']['instalment'][0]['instalment_number'];
          instalment_price.value = responseData['data']['instalment'][0]['instalment_price'];
          status_installment.value = responseData['data']['instalment'][0]['status_installment'];
          due_date.value = responseData['data']['instalment'][0]['due_date'];
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
    return DefaultTabController(
      animationDuration: const Duration(seconds: 2),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff025464),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: const Text(
            "Rincian Order User",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: isLoading?const LinearProgressIndicator(
          ///style
          valueColor:AlwaysStoppedAnimation<Color>(Colors.grey),
        ):ListView(physics: ClampingScrollPhysics(), children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            child: const Text(
              'Rincian Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
            child: Column(
              children: [
                Obx(() => Image(
                    width: 120,
                    image: NetworkImage(
                      image.value,
                    ))
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(() =>
                    Text(
                      title.value,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          ///Rincian pesanan
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
                ///Nomor Pesanan
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
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
                        'Nomor Pesanan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Obx(() => Text(
                        no_order.value,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        'Tenor',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$tenor Bulan',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                ///Total Tagihan
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        'Total Tagihan',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        price.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                //Tagihan Tersisa
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tagihan Tersisa',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        price.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          ///Rincian Cicilan
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cicilan 1',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Obx(() => Text(
                        instalment_price.value.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),),
                      TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const DetailPembayaranCicilan()),
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
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
          ///alamat
            height: 24,
          ),
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
                    'Alamat Pengiriman',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Obx(() => Text(
                      address.value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),)
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          ///Catatan
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xffE3E9EB))),
                  ),

                  child: const Text(
                    'Tanggal Sampai',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                ///arrival date
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Obx(() => Text(
                      arrival_date.value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),)
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          ///Resi
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
                ///Head
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xffE3E9EB))),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kode Resi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                ///resi
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Obx(() => Text(
                      airway_bill.value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),)
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),
          ///tanggal sampai
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xffE3E9EB))),
                  ),

                  child: const Text(
                    'Tanggal Sampai',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                ///arrival date
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Obx(() => Text(
                      arrival_date.value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),)
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
