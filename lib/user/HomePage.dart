import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paylater/user/LinkCustomer.dart';
import 'package:paylater/user/PengajuanLink.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navbar/SearchBar.dart';
import 'components/home_page/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = "";
  var url = "".obs;
  List datas = [];
  var status = "".obs;
  bool isLoading = false;
  bool success = false;
  var role = "".obs;

  @override
  void initState() {
    super.initState();
    getToken();
    LinkbyId();
    ProfilebyId();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  final TextEditingController inputUrl = TextEditingController();
  final TextEditingController inputAlamat = TextEditingController();
  final TextEditingController inputVarian = TextEditingController();

  void PostLink(String url, String address, String note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id')!;
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/link-store/$id'),
          headers: {
            'Authorization': token,
          },
          body: {
            'url': url,
            'address': address,
            'note': note,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == false) {
          AlertDialog alert = AlertDialog(
            title: const Text("Gagal Mengirim Link"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
          showDialog(context: context, builder: (context) => alert);
        } else {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => LinkCustomer()));
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
          title: Text('${responseData['message']}'),
          content: Text('${responseData['data']['address']}'),
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

  void ProfilebyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-user-profile/$id'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print(responseData['data']['role']);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            role.value = responseData['data']['role'];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void LinkbyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;
    var id = prefs.getInt('id')!;
    print(id);
    setState(() {
      isLoading = true;
    });
    try {
      var response = await get(
          Uri.parse(
              'https://paylater.harysusilo.my.id/api/get-link?user_id=$id&status=request'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas = responseData['data']['data'];
        if (responseData['success'] == false) {
          print('gagal');
        } else {
          setState(() {
            url.value = responseData['data']['data']['url'];
            status.value = responseData['data']['data']['status'];
            success = responseData['success'];
          });
        }
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
    return Scaffold(
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
        color: Colors.white,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            ///style
            color: Colors.grey,
          ):ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                height: 340,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/background/bg-landing.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/logo.png',
                                  height: 48,
                                ),
                                const Text(
                                  'Paylater Syariah',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BannerView(),
                  ],
                ),
              ),

              ///pengajuan link
              Container(
                height: 110,
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                  color: Color(0xFFF6F6F6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  child:
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: PaylaterTheme.maincolor),
                    onPressed: role.value == 'pengawas'?null:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const PengajuanLinkProduk(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add_link_sharp,
                      size: 24,
                      color: Color.fromARGB(255, 215, 194, 0),
                    ),
                    label: const Text("Ajukan URL Produk",
                        style: TextStyle(
                            color: PaylaterTheme.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     SizedBox(
                  //       width: 270,
                  //       child: TextField(
                  //         maxLines: 1,
                  //         keyboardType: TextInputType.url,
                  //         controller: inputUrl,
                  //         style: TextStyle(
                  //             color: Colors.blue[500], fontSize: 16, fontWeight: FontWeight.w400),
                  //         decoration: InputDecoration(
                  //             hoverColor: Colors.orangeAccent,
                  //             border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(20)),
                  //             prefixIcon: const Icon(Icons.link),
                  //             hintText: 'Paste link disini',
                  //             hintStyle: TextStyle(
                  //                 color: Colors.grey.shade600,
                  //                 fontSize: 15)),
                  //       ),
                  //     ),
                  //     ElevatedButton(
                  //       style: ButtonStyle(
                  //         padding: const MaterialStatePropertyAll(
                  //           EdgeInsets.symmetric(vertical: 16)
                  //         ),
                  //         backgroundColor: MaterialStateProperty.all(
                  //             role.value == 'pengawas'?PaylaterTheme.light_grey:PaylaterTheme.maincolor),
                  //         shape: MaterialStateProperty.all<
                  //             RoundedRectangleBorder>(
                  //             RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(32.0),
                  //             )),
                  //       ),
                  //       onPressed: role.value == 'pengawas'?null:() =>
                  //       {PostLink(inputUrl.text.toString())},
                  //       child: const Icon(
                  //         Icons.send_rounded,
                  //         size: 20,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Riwayat Pengajuan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: PaylaterTheme.maincolor,
                        fontFamily: PaylaterTheme.fontName,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: role.value == 'pengawas'?null:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LinkCustomer(),
                                ),
                              );
                            },
                            child: const Text('Lihat Semua',
                                style: TextStyle(fontSize: 12))),
                        const Icon(
                          Icons.chevron_right,
                          color: PaylaterTheme.maincolor,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),

              ///daftar link
              MaterialButton(
                onPressed: role.value == 'pengawas'?null:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LinkCustomer(),
                    ),
                  );
                },
                child: success == true
                    ? Column(
                        children: [
                          Image.asset(
                            'assets/images/dataNotFound.jpg',
                            height: 160,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Data Pengajuan Link Tidak Ditemukan')
                        ],
                      )
                    : Container(
                        height: 365,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 300,
                              child: Center(
                                child: ListView.builder(
                                  itemCount: datas.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const LinkCustomer(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              constraints:
                                                  const BoxConstraints(maxWidth:double.infinity),
                                              height: 52,
                                              width: 360,
                                              padding:
                                                  const EdgeInsets.symmetric(horizontal: 30),
                                              decoration: BoxDecoration(
                                                  color: PaylaterTheme.white,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0x4093B0AF),
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      datas[index]['url'],
                                                      overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                      style: const TextStyle(
                                                          color: PaylaterTheme
                                                              .darkerText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        datas[index]['status'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            color:
                                                            PaylaterTheme
                                                                .orange,
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                      PopupMenuButton(
                                                          child: const Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets
                                                                  .all(
                                                                  16.0),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .ellipsis_vertical,
                                                                size: 16,
                                                              ),
                                                            ),
                                                          ),
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem(
                                                              value:
                                                              1,
                                                              child: TextButton(
                                                                  onPressed: () async {
                                                                    await Clipboard.setData(ClipboardData(text: datas[index]['url']));
                                                                    AlertDialog alert = AlertDialog(
                                                                      title: const Text('Berhasil Menyalin Link : '),
                                                                      content: Text(datas[index]['url']),
                                                                      backgroundColor: Colors.white,
                                                                      icon: const Icon(CupertinoIcons.checkmark_seal_fill, size: 20),
                                                                      iconColor: PaylaterTheme.maincolor,
                                                                      actions: [
                                                                        TextButton(
                                                                          child: const Text('Ok'),
                                                                          onPressed: () => Navigator.of(context).pop(),
                                                                        ),
                                                                      ],
                                                                    );
                                                                    showDialog(context: context, builder: (context) => alert);
                                                                  },
                                                                  child: const Text(
                                                                    'salin',
                                                                    style: TextStyle(color: Colors.black),
                                                                  )),
                                                            ),
                                                            PopupMenuItem(
                                                              value:
                                                              2,
                                                              child: TextButton(
                                                                  onPressed: () => Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) => RincianAkad(
                                                                          link_id: datas[index]['id'],
                                                                          user_id: datas[index]['user_id'],
                                                                        )),
                                                                  ),
                                                                  child: const Text(
                                                                    'Akad',
                                                                    style: TextStyle(color: Colors.black),
                                                                  )),
                                                            ),
                                                          ])
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
