import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/AkadCustomer.dart';
import 'package:paylater/user/homeComponents/kategoriComp.dart';
import 'package:paylater/user/homeComponents/trendingComp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/home_page/banner_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            title: Text("Gagal Mengirim Link"),
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
                  builder: (BuildContext context) => RincianAkad(
                        fotoProduk: responseData['data']['image'],
                        namaProduk: responseData['data']['title'],
                        hargaProduk: responseData['data']['price'],
                        url: url,
                      )));
          AlertDialog alert = AlertDialog(
            title: Text("Berhasil"),
            content: Container(
              child: Text(responseData['message']),
            ),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

          showDialog(context: context, builder: (context) => alert);
        }
      }
      if (response.statusCode == 422) {
        var responseData = json.decode(response.body);
        AlertDialog alert = AlertDialog(
          title: Text(responseData['message']),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => alert);
      }
      if (response.statusCode == 404) {
        AlertDialog alert = AlertDialog(
          title: Text("Email tidak terdaftar"),
          content: Container(
            child: Text("Email yang anda masukan salah"),
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
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
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
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
                          padding: EdgeInsets.only(
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
                              Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
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
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
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
                            prefixIcon: Icon(Icons.link),
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
                              child: Text('Submit'),
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
            SizedBox(
              height: 10,
            ),
            KategoriComp(),
            TrendingComp(),
          ],
        ),
      ),
    );
  }
}
