import 'package:flutter/material.dart';
import '../../theme.dart';
import '../admin_editakun.dart';
import '../models/user.dart';

class AkunAdminPengawas extends StatelessWidget {
  const AkunAdminPengawas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
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
                                            style: const TextStyle(
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
                              icon: const Icon(
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
    );
  }
}
