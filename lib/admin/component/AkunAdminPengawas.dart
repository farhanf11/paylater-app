import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:paylater/admin/detail_AkunCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme.dart';
import '../admin_createakun.dart';


class AkunAdminPengawas extends StatefulWidget {
  const AkunAdminPengawas({Key? key}) : super(key: key);

  @override
  State<AkunAdminPengawas> createState() => _AkunAdminPengawasState();
}
class User {
  int id;
  String user_name;
  String phone_number;
  String email_address;
  String job;
  String role;
  String image_face;

  User({
    required this.id,
    required this.user_name,
    required this.email_address,
    required this.phone_number,
    required this.job,
    required this.role,
    required this.image_face,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    user_name: json["user_name"],
    email_address: json["email_address"],
    phone_number: json["phone_number"],
    job: json["job"],
    role: json["role"],
    image_face: json["image_face"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": user_name,
    "email_address": email_address,
    "phone_number": phone_number,
    "job": job,
    "role": role,
    "image_face": image_face,
  };
}



class _AkunAdminPengawasState extends State<AkunAdminPengawas> {
  _AkunAdminPengawasState();
  String token = "";
  List datas = [];

  void initState() {
    fetchPendingAkun();
  }

  void fetchPendingAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      print(token);
    });
    try {
      Response response = await get(
          Uri.parse('https://paylater.harysusilo.my.id/api/admin/get-user?status=pending&page=1'),
          headers: {
            'Authorization': token,
          });

      if (response.statusCode == 200) {
        // final List<dynamic> responseData = json.decode(response.body);
        var responseData = json.decode(response.body);
        datas =  responseData['data'] as List<dynamic>;
        print(datas);
        // return Customer(data: datas);
      }else{
        print('gagal');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Admin",
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
                      ), backgroundColor: PaylaterTheme.maincolor),
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
          SizedBox(height: 10,),
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () { Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailAkun(user_id: 0,))); },
                        child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: PaylaterTheme.spacer,
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
                                      Text(datas[index].user_name.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text('00000',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: PaylaterTheme
                                                .deactivatedText,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(width: 20,),
                                  Text('email',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                        PaylaterTheme.deactivatedText,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ///button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.check_box_rounded,
                                color: PaylaterTheme.nearlyDarkBlue,
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: IconButton(
                              icon: Icon(
                                Icons.disabled_by_default,
                                color: PaylaterTheme.decline,
                                size: 25,
                              ),
                              onPressed: () {},
                            ),
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
