import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/component/DetailPembayaranCicilan.dart';
import 'package:paylater/admin/component/TambahResi.dart';
import 'package:paylater/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class RincianCicilanAdmin extends StatefulWidget {
  const RincianCicilanAdmin(
      {Key? key, required this.order_id, required this.user_id})
      : super(key: key);
  final int order_id;
  final int user_id;

  @override
  State<RincianCicilanAdmin> createState() => _RincianCicilanAdminState();
}

class _RincianCicilanAdminState extends State<RincianCicilanAdmin> {
  _RincianCicilanAdminState();
  String token = "";
  var id = 0.obs;
  var no_order = "".obs;
  var airway_bill = "".obs;
  var user_id = 0.obs;
  var price = 0.obs;
  var status = "".obs;
  var image = "".obs;
  var url = "".obs;
  var title = "".obs;
  var total_price = 0.obs;
  var tenor = "".obs;
  var address = "".obs;
  var note = "".obs;
  var arrival_date = "".obs;
  var request_date = "".obs;
  var created_at = "".obs;

  var id_installment = 0.obs;
  var order_id = 0.obs;
  var instalment_unique_id = "6".obs;
  var instalment_number = "".obs;
  var instalment_price = 0.obs;
  var status_installment = "approve".obs;
  var due_date = "".obs;
  var user_name ="".obs;
  var phone_number = "".obs;
  bool isLoading = false;
  List cicilans = [];

  @override
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
        print('cicilan : '+responseData['data']['instalment'][0]['instalment_number']);
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          setState(() {
            id.value = responseData['data']['id'];
            user_id.value = responseData['data']['user_id'];
            phone_number.value = responseData['data']['user']['phone_number'];
            user_name.value = responseData['data']['user']['user_name'];
            no_order.value = responseData['data']['no_order'];
            title.value = responseData['data']['title'];
            price.value = responseData['data']['price'];
            status.value = responseData['data']['status'];
            image.value = responseData['data']['image'];
            created_at.value = responseData['data']['created_at'];
            tenor.value = responseData['data']['tenor']??"";
            address.value = responseData['data']['address']??"";
            total_price.value = responseData['data']['total_price']??"";
            note.value = responseData['data']['note']??"";
            airway_bill.value = responseData['data']['airway_bill']??"";
            arrival_date.value = responseData['data']['arrival_date']??"";
            request_date.value = responseData['data']['request_date']??"";
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
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            ///style
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          ):
          ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                  ///image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    child: Column(
                      children: [
                        Obx(() => Image(
                            width: 120,
                            image: NetworkImage(
                              image.value.toString(),
                            ))),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(
                          () => Text(
                            title.value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
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
                        ///username
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
                                'Username (id)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Obx(
                                    () => Text(
                                      '${user_name.value} (${user_id.value})',
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

                        ///telepon
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
                                'No Telepon',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                phone_number.value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),

                        ///tanggal
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tanggal',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Obx(() => Text(
                                created_at.value.toString(),
                                overflow: TextOverflow.ellipsis,
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

                  const SizedBox(
                    height: 24,
                  ),

                  ///Rincian pesanan
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
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

                          ///Tenor
                          if (tenor.value!=null && tenor.value!="")
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
                                  Obx(() => Text(
                                    '${tenor.value} Bulan',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),)
                                ],
                              ),
                            ),

                          ///harga
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
                                  'Harga Barang',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Obx(() => Text(
                                  price.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),)
                              ],
                            ),
                          ),

                          ///total harga
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                Obx(() => Text(
                                  total_price.value.toString(),
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
                  ),

                if (status.value != null && status.value != 'request')
                    const SizedBox(
                      height: 24,
                    ),

                  ///Rincian Cicilan
                if (status.value != null && status.value != 'request')
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                        Row(
                                          children: [
                                            if(cicilans[index]['status'] == "approve")
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Icon( CupertinoIcons.checkmark_seal_fill,
                                                  size: 20, color: PaylaterTheme.maincolor,
                                                ),
                                              ),
                                            if(cicilans[index]['status'] == "pending")
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8),
                                                child: Icon( CupertinoIcons.clock,
                                                  size: 20, color: PaylaterTheme.orange,
                                                ),
                                              ),
                                            Text(
                                              'Cicilan-${cicilans[index]['instalment_number']}',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          cicilans[index]['instalment_price'].toString(),
                                          style: const TextStyle(
                                              color: PaylaterTheme.orange,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        TextButton(
                                            onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) => DetailPembayaranCicilan(
                                                    instalment_id: cicilans[index]['id'],
                                                    order_id: cicilans[index]['order_id'],
                                                  )),
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 4, horizontal: 12
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  color: PaylaterTheme.maincolor),
                                              child: const Text(
                                                'Lihat',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                          ),
                        ],
                      ),
                    ),

                if (status.value != null && status.value != 'request')
                  ///alamat
                  const SizedBox(
                    height: 24,
                  ),

                if (status.value != null && status.value != 'request')
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                            )
                        ),
                      ],
                    ),
                  ),

                if (status.value != null && status.value != 'request')
                  const SizedBox(
                    height: 24,
                  ),

                  ///resi
                if (status.value != null && status.value != 'request')
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                            builder: (context) => TambahResi(
                                                  order_id: id.toString(),
                                                )),
                                      ),
                                  style: ButtonStyle(
                                    shape:
                                        MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                                    backgroundColor: const MaterialStatePropertyAll(
                                        PaylaterTheme.maincolor),
                                  ),
                                  child: const Text(
                                    "Tambah Resi",
                                    style: TextStyle(color: Colors.white),
                                  )),
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
                            )
                        ),
                      ],
                    ),
                  ),

                if (status.value != null && status.value == 'ongoing')
                  const SizedBox(
                    height: 24,
                  ),

                  ///notes
                if (status.value != null && status.value != 'request')
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
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                              )
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(
                    height: 24,
                  ),
          ]),
        ),
      ),
    );
  }
}
