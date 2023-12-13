import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/detail_AkunCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';


class AkunCustomer extends StatefulWidget {
  const AkunCustomer({Key? key}) : super(key: key);

  @override
  State<AkunCustomer> createState() => _AkunCustomerState();
}

class _AkunCustomerState extends State<AkunCustomer> {
  _AkunCustomerState();
  String token = "";
  List datas = [];
  bool isLoading = false;
  var id = 0;

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
      Response response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/get-user?status=verified&page=1'),
          headers: {
            'Authorization': token,
          });
      inspect(response);
      if (response.statusCode == 200) {
        // final List<dynamic> responseData = json.decode(response.body);
        var responseData = json.decode(response.body);
        datas =  responseData['data']['data'];
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
    return Container(
      color: PaylaterTheme.spacer,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                          child: Container(
                            width: 280,
                            decoration: BoxDecoration(
                                color: PaylaterTheme.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        datas[index]['image_face']
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(datas[index]['user_name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            )
                                        ),
                                        Text(
                                            datas[index]['email_address'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: PaylaterTheme
                                                  .deactivatedText,
                                            )
                                        ),
                                      ],
                                    ),
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
        ],
      ),
    );
  }
}
