import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:paylater/user/TransferBank.dart';

import '../admin/component/popup.dart';
import '../components/profileComponent/buttonProfile.dart';
import '../components/profileComponent/dataButton.dart';
import '../profile_page/helpCenter.dart';
import '../theme.dart';

class DetailPembayaran extends StatelessWidget {
  const DetailPembayaran({Key? key}) : super(key: key);
  final _headerStyle = const TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _headerSubStyle = const TextStyle(color: Color(0xff025464), fontSize: 14, fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
  final _bca = '''500012345 An. Ilkompay''';
  final quote = "This is a very awesome quote";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3E9EB),
      appBar: AppBar(
        backgroundColor: Color(0xff025464),
        title: const Text('Detail Pembayaran Cicilan'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
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
                      ///BCA
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
                      ///BRI
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
                      ///BNI
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
                      ///BTN
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
              ],
            ),
            ///detail
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //ID Pesanan
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ID Pesanan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          '12345678',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  //Tenor
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tenor Pembayaran',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          '3 Bulan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  //Total Tagihan
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Tagihan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          '1.500.000',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  //Tagihan Tersisa
                ],
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            ///upload bukti
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Bukti Pembayaran',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                primary: PaylaterTheme.maincolor),
                            onPressed: () {
                              Popup.textInputDialog(context,
                                  title: "Masukan Kode Resi",
                                  dialogCallback: (value) async {
                                    if (value == 'Confirm') {}
                                    if (value == 'Cancel') {}
                                  });
                            },
                            label: const Text("Upload Bukti Bayar",
                                style: TextStyle(
                                    color: PaylaterTheme.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)
                            ),
                          icon: const Icon(
                            size: 16,
                            Icons.add_box,
                            color: Color.fromARGB(255, 190, 190, 190),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Tenor
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: const Text(
                      'Belum Ada Bukti',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
