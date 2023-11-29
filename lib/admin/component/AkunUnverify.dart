import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/detail_AkunCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';
import '../admin_createakun.dart';
import 'AdminNavbarBot.dart';

class AkunUnverify extends StatefulWidget {
  const AkunUnverify({Key? key}) : super(key: key);

  @override
  State<AkunUnverify> createState() => _AkunUnverifyState();
}

class _AkunUnverifyState extends State<AkunUnverify> {
  _AkunUnverifyState();
  String token = "";
  List datas = [];
  bool isLoading = false;
  var _currentPage = 0.obs;
  var last_page = 1.obs;
  List links = [];

  @override
  void initState() {
    super.initState();
    getAkun();
  }

  Future<void> getAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      token = prefs.getString('token')!;
    });
    try {
      var response = await get(
          Uri.parse(
              'https://paylater.harysusilo.my.id/api/admin/get-user?status=pending&page=1'),
          headers: {
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas = responseData['data']['data'];
        _currentPage.value = responseData['data']['current_page'];
        last_page.value = responseData['data']['last_page'];
        links = responseData['data']['links'];
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

  void VerifyAkun(var user_id, String is_verified) async {
    try {
      var response = await post(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/verify-user'),
          headers: {
            'Authorization': token,
          },
          body: {
            'id': user_id,
            'is_verified': is_verified,
          });

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if(responseData['success'] == false ){
          print('gagal');
        }else{
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => AdminNavbarBot()));
          AlertDialog alert = AlertDialog(
            icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_checkmark, size: 18,),
            iconColor: PaylaterTheme.maincolor,
            title: const Text("Verifikasi Akun"),
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
          title: Text(responseData['message']),
          content: const Text('Tidak sesuai'),
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
    return Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Belum Terverifikasi Oleh Admin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: PaylaterTheme.maincolor),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CreateAkun()));
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: PaylaterTheme.light_grey,
                        ),
                        label: const Text("Buat Akun",
                            style: TextStyle(
                                color: PaylaterTheme.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator(
                      ///style
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ):ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (BuildContext context, int index) {
                        ///card user
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailAkun(
                                          id: datas[index]['id'],
                                        )
                                      )
                                  );
                                },
                                child: Expanded(
                                  child: Container(
                                    width: 240,
                                    decoration: BoxDecoration(
                                        color: PaylaterTheme.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(datas[index]['user_name'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Text(datas[index]['email_address'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: PaylaterTheme
                                                        .deactivatedText,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              ///button
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.check_box_rounded,
                                      color: PaylaterTheme.nearlyDarkBlue,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      VerifyAkun(
                                          datas[index]['id'].toString(),
                                          "verified"
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.disabled_by_default,
                                      color: PaylaterTheme.decline,
                                      size: 25,
                                    ),
                                    onPressed: () {VerifyAkun(
                                        datas[index]['id'].toString(),
                                        "rejected"
                                    );
                                    },
                                  ),
                                ],
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
    );
  }
}
