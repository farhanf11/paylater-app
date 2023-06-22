import 'package:flutter/material.dart';
import 'package:paylater/admin/admin_homepage.dart';
import 'package:paylater/admin/admin_keuangan.dart';
import 'package:paylater/admin/admin_transaksi.dart';
import 'package:paylater/admin/admin_akun.dart';

class AdminNavbarBot extends StatefulWidget {
  const AdminNavbarBot({Key? key}) : super(key: key);

  @override
  _AdminNavbarBotState createState() => _AdminNavbarBotState();
}

class _AdminNavbarBotState extends State<AdminNavbarBot> {
  int pageIndex = 0;

  final pages = [
    AdminHomePage(),
    AdminTransaksi(),
    AdminKeuangan(),
    AdminAkun(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.home,
                        color: Colors.teal,
                        size: 32,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        color: Colors.black54,
                        size: 32,
                      ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.request_page,
                        color: Colors.teal,
                        size: 32,
                      )
                    : const Icon(
                        Icons.request_page_outlined,
                        color: Colors.black54,
                        size: 32,
                      ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.payments,
                        color: Colors.teal,
                        size: 32,
                      )
                    : const Icon(
                        Icons.payments_outlined,
                        color: Colors.black54,
                        size: 32,
                      ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.person,
                        color: Colors.teal,
                        size: 32,
                      )
                    : const Icon(
                        Icons.person_outline,
                        color: Colors.black54,
                        size: 32,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
