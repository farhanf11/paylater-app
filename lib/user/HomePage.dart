import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paylater/user/AkadCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tagihan.dart';
import 'components/home_page/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Tagihan tagihan;
  String token = "";

  void initState() {
    getToken();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      print(token);
    });
  }

  final TextEditingController inputUrl = TextEditingController();

  void Scrapp(String url) async {
    try {
      Response response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/scrapper'),
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
                  builder: (BuildContext context) => RincianAkad()));
          AlertDialog alert = AlertDialog(
            title: const Text("Berhasil"),
            content: Text(responseData['message']),
            actions: [
              TextButton(
                child: Text('Ok'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaylaterTheme.nearlyGreen.withOpacity(0.3),
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              height: 400,
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
                      child: TextField(
                        keyboardType: TextInputType.url,
                        textAlignVertical: TextAlignVertical.center,
                        controller: inputUrl,
                        autofocus: true,
                        style: TextStyle(color: Colors.blue[500], fontSize: 16),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.orangeAccent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white)),
                            prefixIcon: const Icon(Icons.link),
                            suffix: ElevatedButton(
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
                                  {Scrapp(inputUrl.text.toString())},
                            ),
                            hintText: 'Paste link here',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 15)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
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

            ///pengajuan link
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            "https://tokopedia.com/seoatu-futsal-nike-mercurial",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        PopupMenuButton(
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  CupertinoIcons.ellipsis_vertical,
                                  size: 16,
                                ),
                              ),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: TextButton(
                                        onPressed: () async {
                                          await Clipboard.setData(
                                              const ClipboardData(
                                                  text:
                                                      "https://tokopedia.com/seoatu-futsal-nike-mercurial"));
                                          AlertDialog alert = AlertDialog(
                                            content: const Text(
                                                'Menyalin Bank BNI Link Produk 1'),
                                            backgroundColor: Colors.white,
                                            icon: const Icon(
                                                CupertinoIcons
                                                    .checkmark_seal_fill,
                                                size: 20),
                                            iconColor: PaylaterTheme.maincolor,
                                            actions: [
                                              TextButton(
                                                child: const Text('Ok'),
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                              ),
                                            ],
                                          );
                                          showDialog(
                                              context: context,
                                              builder: (context) => alert);
                                        },
                                        child: Text(
                                          'salin',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: TextButton(
                                        onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RincianAkad()),
                                            ),
                                        child: Text(
                                          'Akad',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                ])
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            "https://tokopedia.com/seoatu-futsal-nike-mercurial",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        PopupMenuButton(
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  CupertinoIcons.ellipsis_vertical,
                                  size: 16,
                                ),
                              ),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: TextButton(
                                    onPressed: () async {
                                      await Clipboard.setData(
                                          const ClipboardData(
                                              text:
                                              "https://tokopedia.com/seoatu-futsal-nike-mercurial"));
                                      AlertDialog alert = AlertDialog(
                                        content: const Text(
                                            'Menyalin Bank BNI Link Produk 1'),
                                        backgroundColor: Colors.white,
                                        icon: const Icon(
                                            CupertinoIcons
                                                .checkmark_seal_fill,
                                            size: 20),
                                        iconColor: PaylaterTheme.maincolor,
                                        actions: [
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        ],
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (context) => alert);
                                    },
                                    child: Text(
                                      'salin',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: TextButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const RincianAkad()),
                                    ),
                                    child: Text(
                                      'Akad',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ])
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            "https://tokopedia.com/seoatu-futsal-nike-mercurial",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        PopupMenuButton(
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  CupertinoIcons.ellipsis_vertical,
                                  size: 16,
                                ),
                              ),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: TextButton(
                                    onPressed: () async {
                                      await Clipboard.setData(
                                          const ClipboardData(
                                              text:
                                              "https://tokopedia.com/seoatu-futsal-nike-mercurial"));
                                      AlertDialog alert = AlertDialog(
                                        content: const Text(
                                            'Menyalin Bank BNI Link Produk 1'),
                                        backgroundColor: Colors.white,
                                        icon: const Icon(
                                            CupertinoIcons
                                                .checkmark_seal_fill,
                                            size: 20),
                                        iconColor: PaylaterTheme.maincolor,
                                        actions: [
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        ],
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (context) => alert);
                                    },
                                    child: Text(
                                      'salin',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: TextButton(
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const RincianAkad()),
                                    ),
                                    child: Text(
                                      'Akad',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
