import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paylater/user/RiwayatPengajuanLink.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/home_page/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = "";
  var url = "url".obs;
  List datas = [];

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
                  builder: (BuildContext context) => RiwayatPengajuanLink()));
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
    try {
      var response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/get-link?user_id=$id&status='),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas =  responseData['data']['data'];
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          setState(() {
            url.value = responseData['data']['data']['url'];
          });
        }
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
                                  {PostLink(inputUrl.text.toString())},
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
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => RiwayatPengajuanLink(),
                    ),
                  );
                },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
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
                            Text('Lihat Semua', style: TextStyle(fontSize: 12),),
                            Icon(Icons.chevron_right, color: PaylaterTheme.maincolor, size: 20,)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0x2700B6A2), width: 3)
                      ),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "https://shopee.co.id/33919926.22855986007?sp_atk=3a241a3c-889a-427f-a2fb-97f0b6e826ee&xptdk=3a241a3c-889a-427f-a2fb-97f0b6e826ee",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(child: Text(
                            'request',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: PaylaterTheme.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0x2700B6A2), width: 3)
                      ),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "https://shopee.co.id/33919926.22855986007?sp_atk=3a241a3c-889a-427f-a2fb-97f0b6e826ee&xptdk=3a241a3c-889a-427f-a2fb-97f0b6e826ee",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(child: Text(
                            'request',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: PaylaterTheme.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0x2700B6A2), width: 3)
                      ),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "https://shopee.co.id/33919926.22855986007?sp_atk=3a241a3c-889a-427f-a2fb-97f0b6e826ee&xptdk=3a241a3c-889a-427f-a2fb-97f0b6e826ee",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(child: Text(
                            'request',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: PaylaterTheme.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0x2700B6A2), width: 3)
                      ),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "https://shopee.co.id/33919926.22855986007?sp_atk=3a241a3c-889a-427f-a2fb-97f0b6e826ee&xptdk=3a241a3c-889a-427f-a2fb-97f0b6e826ee",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(child: Text(
                            'request',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: PaylaterTheme.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0x2700B6A2), width: 3)
                      ),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "https://shopee.co.id/33919926.22855986007?sp_atk=3a241a3c-889a-427f-a2fb-97f0b6e826ee&xptdk=3a241a3c-889a-427f-a2fb-97f0b6e826ee",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(child: Text(
                            'request',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: PaylaterTheme.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
