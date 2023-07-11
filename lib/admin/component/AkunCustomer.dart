import 'package:flutter/material.dart';
import '../../theme.dart';
import '../admin_createakun.dart';
import '../admin_editakun.dart';
import '../models/user.dart';

class AkunCustomer extends StatelessWidget {
  const AkunCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Customer",
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
                                          style: const TextStyle(
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
        ],
      ),
    );
  }
}
