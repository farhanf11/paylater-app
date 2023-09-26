import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paylater/theme.dart';

class TransferBank extends StatelessWidget{
  const TransferBank({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _headerSubStyle = const TextStyle(color: Color(0xff025464), fontSize: 14, fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal);
  final _bca = '''500012345''';
  final _bni = '''12500012345''';
  final _btn = '''2201200012345''';
  final _bri = '''612300012331100''';
  final quote = "This is a very awesome quote";




  @override

  build(context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: const Color(0xff025464),
      title: const Text('Payment Methode'),
      leading: const BackButton(),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Text('Total Pembayaran'),
                SizedBox(height: 10,),

              ],
            ),
          ),
          SizedBox(height: 12,),
          Accordion(
            maxOpenSections: 2,
            headerBackgroundColorOpened: Colors.black54,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
            const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              //about ilkompay
              AccordionSection(
                headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                isOpen: true,
                header: Text('Transfer Bank', style: _headerStyle),
                contentBorderColor: const Color(0xff568D98),
                headerBackgroundColor: Color(0xff568D98),
                headerBackgroundColorOpened: Color(0xff2E8A99),
                content: Accordion(
                  maxOpenSections: 1,
                  headerBackgroundColorOpened: Colors.black54,
                  headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  children: [
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: const Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BCA', style: _headerSubStyle),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$_bca An. Ilkompay", style: _contentStyle),
                          IconButton(onPressed: () async {
                          await Clipboard.setData(ClipboardData(text: _bca));
                            AlertDialog alert = AlertDialog(
                              content: Text('Menyalin Bank BCA $_bca'),
                              backgroundColor: Colors.white,
                              icon: const Icon(CupertinoIcons.checkmark_seal_fill),
                              iconColor: PaylaterTheme.maincolor,
                              actions: [
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                          showDialog(context: context, builder: (context) => alert);
                          },
                              icon: const Icon(
                                 Icons.copy,
                                color: PaylaterTheme.maincolor,
                                size: 12,
                              ))
                        ],
                      ),
                      contentHorizontalPadding: 20,
                    ),

                    ///bni
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BNI', style: _headerSubStyle),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$_bni An. Ilkompay", style: _contentStyle),
                          IconButton(onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: _bni));
                            AlertDialog alert = AlertDialog(
                              content: Text('Menyalin Bank BNI $_bni'),
                              backgroundColor: Colors.white,
                              icon: const Icon(CupertinoIcons.checkmark_seal_fill),
                              iconColor: PaylaterTheme.maincolor,
                              actions: [
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                            showDialog(context: context, builder: (context) => alert);
                          },
                              icon: const Icon(
                                Icons.copy,
                                color: PaylaterTheme.maincolor,
                                size: 12,
                              ))
                        ],
                      ),
                      contentHorizontalPadding: 20,
                    ),

                    ///btn
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BTN', style: _headerSubStyle),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$_btn An. Ilkompay", style: _contentStyle),
                          IconButton(onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: _bri));
                            AlertDialog alert = AlertDialog(
                              content: Text('Menyalin Bank BTN $_bri'),
                              backgroundColor: Colors.white,
                              icon: const Icon(CupertinoIcons.checkmark_seal_fill),
                              iconColor: PaylaterTheme.maincolor,
                              actions: [
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                            showDialog(context: context, builder: (context) => alert);
                          },
                              icon: const Icon(
                                Icons.copy,
                                color: PaylaterTheme.maincolor,
                                size: 12,
                              ))
                        ],
                      ),
                      contentHorizontalPadding: 20,
                    ),

                    ///bri
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: const Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BRI', style: _headerSubStyle),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$_bri An. Ilkompay", style: _contentStyle),
                          IconButton(onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: _bri));
                            AlertDialog alert = AlertDialog(
                              content: Text('Menyalin Bank BRI $_bri'),
                              backgroundColor: Colors.white,
                              icon: const Icon(CupertinoIcons.checkmark_seal_fill),
                              iconColor: PaylaterTheme.maincolor,
                              actions: [
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                            showDialog(context: context, builder: (context) => alert);
                          },
                              icon: const Icon(
                                Icons.copy,
                                color: PaylaterTheme.maincolor,
                                size: 12,
                              ))
                        ],
                      ),
                      contentHorizontalPadding: 20,
                    ),
                  ],
                ),
              ),
              //Register Ilkompay
            ],
          ),
        ],
      ),
    ),
  );
} //__
