import 'dart:math';
import 'dart:ui';
import 'package:paylater/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:snipitz/widgets/button_widget.dart';
// import 'package:snipitz/widgets/menu_bottom_sheet_widget.dart';
// import 'package:snipitz/widgets/text_field_widget.dart';

class Popup {
  // static void alertDialog(context,
  //     {String message, Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Text(message, style: Styles.dialogContentTextStyle),
  //         actions: [
  //           FlatButton(
  //             child: Text("OK", style: Styles.dialogYesTextStyle),
  //             onPressed: () {
  //               if (dialogCallback != null) {
  //                 dialogCallback('OK');
  //               } else {
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  static void confirmDialog(context,
      {required String message, required Function(String) dialogCallback}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    height: 30,
                    child: ElevatedButton(
                      child: const Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                        primary: PaylaterTheme.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (dialogCallback != null) {
                          dialogCallback("Cancel");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 30,
                    child: ElevatedButton(
                      child: const Text("Confirm"),
                      style: ElevatedButton.styleFrom(
                        primary: PaylaterTheme.maincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();

                        if (dialogCallback != null) {
                          dialogCallback("Confirm");
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static void textInputDialog(context,
      {required String title, required Function(String) dialogCallback}) {
    TextEditingController input = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)), //this right here
            child: Wrap(
              //height: 200,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$title',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: TextField(
                          // selectionHeightStyle:
                          //     BoxHeightStyle.includeLineSpacingMiddle,
                          controller: input,
                          maxLines: 1,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 7.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaylaterTheme.dark_grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText: '',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: PaylaterTheme.dark_grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                child: const Text("Cancel"),
                                style: ElevatedButton.styleFrom(
                                  primary: PaylaterTheme.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  if (dialogCallback != null) {
                                    dialogCallback("Cancel");
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                child: const Text("Confirm"),
                                style: ElevatedButton.styleFrom(
                                  primary: PaylaterTheme.maincolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  if (dialogCallback != null) {
                                    dialogCallback("Confirm");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  // static void toast(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 2,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  // static void successDialog(context,
  //     {String message, Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Text(message, style: Styles.dialogContentTextStyle),
  //         actions: [
  //           FlatButton(
  //             child: Text("OK", style: Styles.dialogYesTextStyle),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               if (dialogCallback != null) {
  //                 dialogCallback("Yes");
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static void successUpdateDialog(context,
  //     {String message, Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: EdgeInsets.all(24),
  //         title: Image.asset(
  //           "assets/images/Update_Check.png",
  //           width: 75,
  //           height: 75,
  //         ),
  //         content: Center(
  //           heightFactor: 2,
  //           child: Text(
  //             message,
  //             style: Styles.dialogContentTextStyle,
  //           ),
  //         ),
  //         actions: [
  //           Center(
  //             child: ButtonWidget(
  //               label: "OK",
  //               buttonWidth: 200,
  //               cornerRadius: 15,
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 if (dialogCallback != null) {
  //                   dialogCallback("Yes");
  //                 }
  //               },
  //             ),
  //           ),
  //         ],
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       );
  //     },
  //   );
  // }

  // static void notVerifiedDialog(context,
  //     {String message,
  //     String m1,
  //     String m2,
  //     String m3,
  //     Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         insetPadding: EdgeInsets.all(50),
  //         buttonPadding: EdgeInsets.only(right: 30),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 0),
  //         title: Image.asset(
  //           "assets/images/id-card.png",
  //           width: 100,
  //           height: 100,
  //         ),
  //         content: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               message,
  //               style: Styles.dialogContentTextStyle,
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(
  //               height: 5,
  //             ),
  //             ListTile(
  //               minLeadingWidth: 1,
  //               leading: Icon(
  //                 Icons.fiber_manual_record,
  //                 color: Colors.blue,
  //               ),
  //               title: Text(m1, style: TextStyle(color: Colors.grey)),
  //               enabled: false,
  //             ),
  //             ListTile(
  //               minLeadingWidth: 1,
  //               leading: Icon(
  //                 Icons.fiber_manual_record,
  //                 color: Colors.blue,
  //               ),
  //               title: Text(m2, style: TextStyle(color: Colors.grey)),
  //               enabled: false,
  //             ),
  //             ListTile(
  //               minLeadingWidth: 1,
  //               leading: Icon(
  //                 Icons.fiber_manual_record,
  //                 color: Colors.blue,
  //               ),
  //               title: Text(m3, style: TextStyle(color: Colors.grey)),
  //               enabled: false,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               ButtonWidget(
  //                 label: "Nanti",
  //                 fontColor: Color.fromRGBO(54, 172, 226, 1),
  //                 backgroundColor: Color.fromRGBO(236, 248, 255, 1),
  //                 elevation: 0,
  //                 buttonWidth: 75,
  //                 cornerRadius: 15,
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                   if (dialogCallback != null) {
  //                     dialogCallback("Nanti");
  //                   }
  //                 },
  //               ),
  //               SizedBox(
  //                 width: 15,
  //               ),
  //               ButtonWidget(
  //                 label: "Mulai",
  //                 buttonWidth: 75,
  //                 elevation: 0,
  //                 cornerRadius: 15,
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                   if (dialogCallback != null) {
  //                     dialogCallback("Mulai");
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // buildMenuItem({String text, IconData icon}) {
  //   final color = Colors.black;
  //   final hoverColor = Colors.black87;

  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       color: Colors.blue,
  //     ),
  //     title: Text(
  //       text,
  //       style: TextStyle(color: color),
  //     ),
  //     hoverColor: hoverColor,
  //     onTap: () {},
  //   );
  // }

  // static void batalkanTransaksiDialog(context,
  //     {String message, Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         insetPadding: EdgeInsets.all(50),
  //         buttonPadding: EdgeInsets.only(right: 30),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //         contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 0),
  //         title: Image.asset(
  //           "assets/images/warning.png",
  //           width: 100,
  //           height: 100,
  //         ),
  //         content: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               message,
  //               style: Styles.dialogContentTextStyle,
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               ButtonWidget(
  //                 label: "YA",
  //                 fontColor: Color.fromRGBO(54, 172, 226, 1),
  //                 backgroundColor: Color.fromRGBO(236, 248, 255, 1),
  //                 elevation: 0,
  //                 buttonWidth: 75,
  //                 cornerRadius: 15,
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                   if (dialogCallback != null) {
  //                     dialogCallback("Yes");
  //                   }
  //                 },
  //               ),
  //               SizedBox(
  //                 width: 15,
  //               ),
  //               ButtonWidget(
  //                 label: "TIDAK",
  //                 buttonWidth: 75,
  //                 elevation: 0,
  //                 cornerRadius: 15,
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                   if (dialogCallback != null) {
  //                     dialogCallback("No");
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // static void cannotUpdateDialog(context, {Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: EdgeInsets.fromLTRB(50, 15, 50, 15),
  //         title: Image.asset(
  //           "assets/images/warning.png",
  //           width: 100,
  //           height: 100,
  //         ),
  //         content: Center(
  //           heightFactor: 1,
  //           widthFactor: 2,
  //           child: Text(
  //               "Update Profile tidak bisa dijalankan karena ada Transaksi yang sedang berjalan",
  //               style: Styles.dialogContentTextStyle,
  //               textAlign: TextAlign.center),
  //         ),
  //         actions: [
  //           Center(
  //             child: ButtonWidget(
  //               label: "OK",
  //               buttonWidth: 150,
  //               cornerRadius: 15,
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 if (dialogCallback != null) {
  //                   dialogCallback("Yes");
  //                 }
  //               },
  //             ),
  //           ),
  //         ],
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       );
  //     },
  //   );
  // }

  // static void cannotBerandaDialog(context,
  //     {String message, Function(String) dialogCallback}) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: EdgeInsets.fromLTRB(50, 15, 50, 15),
  //         title: Image.asset(
  //           "assets/images/warning.png",
  //           width: 100,
  //           height: 100,
  //         ),
  //         content: Center(
  //           heightFactor: 1,
  //           widthFactor: 1,
  //           child: Text(message,
  //               style: Styles.dialogContentTextStyle,
  //               textAlign: TextAlign.center),
  //         ),
  //         actions: [
  //           Center(
  //             child: ButtonWidget(
  //               label: "OK",
  //               buttonWidth: 150,
  //               cornerRadius: 15,
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //                 if (dialogCallback != null) {
  //                   dialogCallback("Yes");
  //                 }
  //               },
  //             ),
  //           ),
  //         ],
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //       );
  //     },
  //   );
  // }
}
