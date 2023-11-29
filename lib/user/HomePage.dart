import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paylater/user/LinkCustomer.dart';
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
  var status = "status".obs;
  bool isLoading = false;
  bool success = false;

  @override
  void initState() {
    super.initState();
    getToken();
    LinkbyId();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  final TextEditingController inputUrl = TextEditingController();

  void PostLink(String url) async {
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
      } else {}
      if (response.statusCode == 422) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: const Text("Kolom harus di isi dengan link produk yang benar"),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        print(responseData['data']);
        showDialog(context: context, builder: (context) => alert);
      }
      if (response.statusCode == 404) {
        AlertDialog alert = AlertDialog(
          title: const Text("Email tidak terdaftar"),
          content: const Text("Email yang anda masukan salah"),
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
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 270,
                              child: TextField(
                                keyboardType: TextInputType.url,
                                textAlignVertical: TextAlignVertical.center,
                                controller: inputUrl,
                                style: TextStyle(
                                    color: Colors.blue[500], fontSize: 16),
                                decoration: InputDecoration(
                                    hoverColor: Colors.orangeAccent,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    prefixIcon: const Icon(Icons.link),
                                    hintText: 'Paste link here',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 15)),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    PaylaterTheme.maincolor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                )),
                              ),
                              child: const Text('Submit'),
                              onPressed: () =>
                                  {PostLink(inputUrl.text.toString())},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.0),
                        child: Text(
                          'tempel link url barang yang ingin anda ajukan pada kolom diatas*',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LinkCustomer(),
                                ),
                              );
                            },
                            child: Text('Lihat Semua',
                                style: TextStyle(fontSize: 12))),
                        Icon(
                          Icons.chevron_right,
                          color: PaylaterTheme.maincolor,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),

              ///pengajuan link
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LinkCustomer(),
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
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 320,
                              child: Flexible(
                                fit: FlexFit.tight,
                                child: Center(
                                  child: ListView.builder(
                                    itemCount: 5,
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
                                              child: Expanded(
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth:
                                                              double.infinity),
                                                  height: 52,
                                                  width: 360,
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 30),
                                                  decoration: BoxDecoration(
                                                      color: PaylaterTheme.white,
                                                      border: Border.all(
                                                          color: const Color(
                                                              0x4093B0AF),
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      Row(
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
                                                          Flexible(
                                                              child: Text(
                                                            datas[index]
                                                                ['status'],
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
                                                          )),
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
                                                      ),
                                                    ],
                                                  ),
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
