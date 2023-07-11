import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransferBank extends StatelessWidget
    {
  const TransferBank({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _headerSubStyle = const TextStyle(color: Color(0xff025464), fontSize: 14, fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
  final _bca = '''500012345 An. Ilkompay''';
  final quote = "This is a very awesome quote";


  @override

  build(context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Color(0xff025464),
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
            child: Column(
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
                EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BCA', style: _headerSubStyle),
                      content: Text(_bca, style: _contentStyle),
                      contentHorizontalPadding: 20,
                    ),

                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BRI', style: _headerSubStyle),
                      content: Text(_bca, style: _contentStyle),
                      contentHorizontalPadding: 20,
                    ),
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BNI', style: _headerSubStyle),
                      content: Text(_bca, style: _contentStyle),
                      contentHorizontalPadding: 20,
                    ),
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('BTN', style: _headerSubStyle),
                      content: Text(_bca, style: _contentStyle),
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
