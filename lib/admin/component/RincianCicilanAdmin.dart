import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/TambahArrivalDate.dart';
import 'package:paylater/admin/component/TambahResi.dart';
import 'package:paylater/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class RincianCicilanAdmin extends StatefulWidget {
  const RincianCicilanAdmin({Key? key, required this.order_id, required this.user_id}) : super(key: key);
  final int order_id;
  final int user_id;

  @override
  State<RincianCicilanAdmin> createState() => _RincianCicilanAdminState();
}

class _RincianCicilanAdminState extends State<RincianCicilanAdmin> {
  _RincianCicilanAdminState();
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
  var instalment_unique_id = "6".obs;
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
            "Rincian Tagihan User",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(physics: ClampingScrollPhysics(), children: [
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
                ))),
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
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       ///Head
          //       Container(
          //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //         decoration: const BoxDecoration(
          //           border: Border(
          //               bottom: BorderSide(
          //                   style: BorderStyle.solid,
          //                   color: Color(0xffE3E9EB))),
          //         ),
          //         child: const Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Rincian Cicilan Pembayaran',
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 14,
          //                   fontWeight: FontWeight.w600),
          //             ),
          //           ],
          //         ),
          //       ),
          //
          //       ///isi
          //       Flexible(
          //         fit: FlexFit.tight,
          //           child: ListView.builder(
          //               itemBuilder: (BuildContext context, int index) {
          //                 return Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       const Text(
          //                         'Cicilan',
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400),
          //                       ),
          //                       Text(
          //                         cicilans[index]['instalment_price'],
          //                         style: const TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w400),
          //                       ),
          //                       TextButton(
          //                           onPressed: () => Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                                 builder: (context) =>
          //                                 const DetailPembayaranCicilan()),
          //                           ),
          //                           child: Container(
          //                             padding: const EdgeInsets.symmetric(
          //                                 vertical: 3, horizontal: 8),
          //                             decoration: BoxDecoration(
          //                                 borderRadius: BorderRadius.circular(4),
          //                                 color: PaylaterTheme.maincolor),
          //                             child: const Text(
          //                               'lihat',
          //                               style: TextStyle(color: Colors.white),
          //                             ),
          //                           )),
          //                     ],
          //                   ),
          //                 );
          //               },
          //           )
          //       )
          //     ],
          //   ),
          // ),

          ///alamat
          const SizedBox(
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

          ///resi

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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kode Resi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TambahResi(order_id: id.toString(),)),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),)),
                            backgroundColor: MaterialStatePropertyAll(PaylaterTheme.maincolor),
                          ),
                          child: const Text(
                            "Tambah Resi",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tanggal Sampai',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TambahArrivalDate(order_id: id.toString(),)),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6),)),
                            backgroundColor: MaterialStatePropertyAll(PaylaterTheme.maincolor),
                          ),
                          child: const Text(
                            "Tetapkan Tanggal",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                      ),
                    ],
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
        ]),
      ),
    );
  }
}
