import 'dart:math';
import 'dart:ui';
import 'package:paylater/admin/admin_createakun.dart';
import 'package:paylater/admin/admin_editakun.dart';
import 'package:paylater/admin/models/user.dart';
import 'package:paylater/components/card_product.dart';
import 'package:paylater/models/categories.dart';
import 'package:paylater/models/products.dart';
import 'package:paylater/navbar/NavbarBot.dart';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import '../components/card_categories.dart';
import '../components/landing_page/banner_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AdminAkun extends StatefulWidget {
  @override
  _AdminAkunState createState() => _AdminAkunState();
}

class _AdminAkunState extends State<AdminAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Akun',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          automaticallyImplyLeading: false,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        backgroundColor: PaylaterTheme.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Customer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Range Data",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        value: 5,
                        items: [
                          DropdownMenuItem(value: 1, child: Text('1')),
                          DropdownMenuItem(value: 2, child: Text('2')),
                          DropdownMenuItem(value: 3, child: Text('3')),
                          DropdownMenuItem(value: 4, child: Text('4')),
                          DropdownMenuItem(value: 5, child: Text('5')),
                        ],
                        onChanged: (value) {
                          print(value);
                        },
                      )
                    ],
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
                              primary: PaylaterTheme.maincolor),
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
                  )
                ],
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: ListView.builder(
                    itemCount: customer.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: PaylaterTheme.spacer,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
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
                                          Text(customer[index].name,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text(customer[index].phonenumber,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: PaylaterTheme
                                                    .deactivatedText,
                                              )),
                                        ],
                                      ),
                                      Text(customer[index].email,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                PaylaterTheme.deactivatedText,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.manage_accounts,
                                      color: PaylaterTheme.blueSky,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditAkun()));
                                    },
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
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Admin dan Pengawas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Range Data",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                        value: 5,
                        items: [
                          DropdownMenuItem(value: 1, child: Text('1')),
                          DropdownMenuItem(value: 2, child: Text('2')),
                          DropdownMenuItem(value: 3, child: Text('3')),
                          DropdownMenuItem(value: 4, child: Text('4')),
                          DropdownMenuItem(value: 5, child: Text('5')),
                        ],
                        onChanged: (value) {
                          print(value);
                        },
                      )
                    ],
                  ),
                ],
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: ListView.builder(
                    itemCount: admin.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: PaylaterTheme.spacer,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
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
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(admin[index].name,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(admin[index].akses,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontStyle: FontStyle.italic,
                                                  )),
                                            ],
                                          ),
                                          Text(admin[index].phonenumber,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: PaylaterTheme
                                                    .deactivatedText,
                                              )),
                                        ],
                                      ),
                                      Text(admin[index].email,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                PaylaterTheme.deactivatedText,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.manage_accounts,
                                      color: PaylaterTheme.blueSky,
                                      size: 25,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditAkun()));
                                    },
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
              ),
            ],
          ),
        ));
  }
}
