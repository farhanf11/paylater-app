import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:paylater/user/DetailPembayaran.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class RincianTagihan extends StatefulWidget {
  const RincianTagihan(
      {Key? key, required this.order_id, required this.user_id})
      : super(key: key);
  final int order_id;
  final int user_id;

  @override
  State<RincianTagihan> createState() => _RincianTagihanState();
}

class _RincianTagihanState extends State<RincianTagihan> {
  _RincianTagihanState();
  String token = "";
  var id = 0.obs;
  var no_order = ''.obs;
  var user_id = 0.obs;
  var image = ''.obs;
  var url = ''.obs;
  var title = ''.obs;
  var price = 0.obs;
  var total_price = 0.obs;
  var tenor = "".obs;
  var address = "".obs;
  var airway_bill = ''.obs;
  var note = "".obs;
  var status = "".obs;

  var id_installment = 0.obs;
  var order_id = 0.obs;
  var instalment_unique_id = "";
  var instalment_number = "".obs;
  var instalment_price = 0.obs;
  var status_installment = "".obs;
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
      isLoading = true;
    });
    try {
      var response = await get(
        Uri.parse(
            'https://paylater.harysusilo.my.id/api/get-order-detail?user_id=${widget.user_id}&order_id=${widget.order_id}'),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        cicilans = responseData['data']['instalment'];
        print("tenor"+responseData['data']['tenor']);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          id.value = responseData['data']['id'];
          no_order.value = responseData['data']['no_order'];
          title.value = responseData['data']['title'];
          price.value = responseData['data']['price'];
          image.value = responseData['data']['image'];
          status.value = responseData['data']['status'];
          total_price.value = responseData['data']['total_price'];
          tenor.value = responseData['data']['tenor'] ?? "-";
          note.value = responseData['data']['note'] ?? "-";
          address.value = responseData['data']['address'] ?? "-";

          id_installment.value =
              responseData['data']['instalment'][0]['id'];
          order_id.value = responseData['data']['instalment'][0]['order_id'];
          instalment_unique_id =
              responseData['data']['instalment'][0]['instalment_unique_id'];
          instalment_number.value =
              responseData['data']['instalment'][0]['instalment_number'];
          instalment_price.value =
              responseData['data']['instalment'][0]['instalment_price'];
          status_installment.value =
              responseData['data']['instalment'][0]['status_installment'];
          due_date.value = responseData['data']['instalment'][0]['due_date'];
          airway_bill.value = responseData['data']['airway_bill'] ?? "-";
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(seconds: 2),
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rincian Pembayaran'),
          backgroundColor: PaylaterTheme.maincolor,
          leading: const BackButton(
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? const LinearProgressIndicator(
                ///style
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              )
            : Container(
              padding: const EdgeInsets.all(24),
              color: PaylaterTheme.spacer,
              child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
                          Obx(
                            () => Text(
                              title.value,
                              textAlign: TextAlign.center,
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
                                  'No Order',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Obx(
                                  () => Text(
                                    no_order.value,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),

                          ///Harga barang
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Harga Barang',
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

                            ///Tenor
                            if (tenor.value != null )
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
                                    'Tenor',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${tenor.value} Bulan',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ///Status
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
                                  'Status Pesanan',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Obx(
                                  () => Text(
                                    status.value,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),

                          ///total harga
                          if (tenor.value != null && tenor.value != '')
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Harga',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Obx(
                                  () => Text(
                                    'Rp ${total_price.value}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (status.value != 'request')
                    const SizedBox(
                        height: 24,
                      ),

                    ///Rincian Cicilan
                    if (status.value != 'request')
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                'Rincian Cicilan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Flexible(
                                fit: FlexFit.tight,
                                child: ListView.builder(
                                  itemCount: cicilans.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 24,
                                      ),
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
                                                color: PaylaterTheme.orange,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          if(cicilans[index]['status'] == "not_yet")
                                          TextButton(
                                              onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    DetailPembayaran(
                                                      order_id: cicilans[index]['order_id'],
                                                      instalment_id: cicilans[index]['id'],
                                                    )),
                                              ), 
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 3, horizontal: 8
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: PaylaterTheme.maincolor),
                                                child: const Text(
                                                  'bayar',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              )),

                                          if(cicilans[index]['status'] == "pending")
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              child: Icon( CupertinoIcons.clock,
                                                size: 20, color: PaylaterTheme.orange,
                                              ),
                                            ),

                                          if(cicilans[index]['status'] == "approve")
                                            const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              child: Icon( CupertinoIcons.checkmark_seal_fill,
                                                size: 20, color: PaylaterTheme.maincolor,
                                              ),
                                            )
                                        ],
                                      ),
                                    );
                                  },
                                )
                            ),
                          ],
                        ),
                      ),

                    ///Catatan Request
                    if (status.value == 'request')
                    const SizedBox(
                        height: 24,
                      ),
                    if (status.value == 'request')
                    Container(
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
                                  vertical: 12, horizontal: 16
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color(0xffE3E9EB))),
                              ),
                              child: const Text(
                                'Catatan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            ///catatan
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: const Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                'Pesanan anda sedang menunggu persetujuan admin, silahkan cek berkala',
                                style: TextStyle(
                                    color: PaylaterTheme.maincolor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),

                    /// alamat pengiriman
                    if (tenor.value != null && tenor.value != '')
                    const SizedBox(
                          ///alamat
                          height: 24,
                        ),
                    if (tenor.value != null && tenor.value != '')
                    Container(
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
                                child: Obx(
                                  () => Text(
                                    address.value,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ],
                        ),
                      ),

                    if (tenor.value != null && tenor.value != '')
                    const SizedBox(
                        height: 24,
                      ),

                    ///Catatan
                    if (tenor.value != null && tenor.value != '')
                    Container(
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
                                'Catatan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            ///catatan
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Obx(
                                  () => Text(
                                    note.value,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    if (tenor.value != null && tenor.value != 'tenor')
                    const SizedBox(
                      height: 24,
                    ),

                    ///Resi
                    if (status.value != 'request')
                    Container(
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
                                child: Obx(
                                  () => Text(
                                    airway_bill.value,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    if (status.value != 'request')
                    const SizedBox(
                      height: 24,
                    ),

                ]),
            ),
      ),
    );
  }
}