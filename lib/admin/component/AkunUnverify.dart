import 'package:flutter/material.dart';
import 'package:paylater/admin/detail_AkunCustomer.dart';
import '../../theme.dart';
import '../admin_createakun.dart';
import '../admin_editakun.dart';
import '../models/user.dart';

class AkunUnverify extends StatelessWidget {
  const AkunUnverify({Key? key}) : super(key: key);

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
              itemCount: customer.length,
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
                                    DetailAkun())); },
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
                                      Text(customer[index].name,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(customer[index].phonenumber,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: PaylaterTheme
                                                .deactivatedText,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(width: 20,),
                                  Text(customer[index].email,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color:
                                        PaylaterTheme.deactivatedText,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      //button
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
