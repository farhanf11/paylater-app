import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/detail_AkunCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';
import '../admin_createakun.dart';

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
      Response response = await get(
          Uri.parse(
              'https://paylater.harysusilo.my.id/api/admin/get-user?status=pending&page=1'),
          headers: {
            'Authorization': token,
          });
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        datas = responseData['data']['data'];
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
    return Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: isLoading
          ? const CircularProgressIndicator(
              ///style

              )
          : Column(
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
                  child: ListView.builder(
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
                                        user_id: datas[index]['id'],
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
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.disabled_by_default,
                                    color: PaylaterTheme.decline,
                                    size: 25,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
