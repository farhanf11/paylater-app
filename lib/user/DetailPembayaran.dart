import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:io';
import 'package:dio/dio.dart';

class DetailPembayaran extends StatefulWidget {
  const DetailPembayaran({Key? key}) : super(key: key);

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();
}

class _DetailPembayaranState extends State<DetailPembayaran> {
  ImagePicker picker = ImagePicker();
  File? image;
  Dio dio = Dio();

  Future pickImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary as File?);
    } on PlatformException catch (e) {
      print('gagal mengambil gambar dari galeri $e');
    }
  }

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _headerSubStyle = const TextStyle(
      color: Color(0xff025464), fontSize: 14, fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
  final _bca = '''500012345 An. Ilkompay''';
  String token = "";

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
    });
  }

  uploadImage(File? image) async {
    var formData = FormData();
    formData.fields.add(MapEntry("order_id", "5"));
    formData.fields.add(MapEntry("instalment_id", "1"));
    formData.files.add(MapEntry(
      "payment_img",
      await MultipartFile.fromFile(image!.path, filename: "pic-name.png"),
    ));
    print("token $token");
    var response = await dio.post(
        'https://paylater.harysusilo.my.id/api/instalment-store/4',
        data: formData,
        options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BheWxhdGVyLmhhcnlzdXNpbG8ubXkuaWQvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2OTk5NTE1NzQsImV4cCI6MTcwMTE2MTE3NCwibmJmIjoxNjk5OTUxNTc0LCJqdGkiOiJ3ZFZNWVhTYm9CaDVOSDhnIiwic3ViIjoiNCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.9MGnfxzC6C87HVW7HcAxvrlc2sIQftXjlc3mip_UKoQ'
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print("response ${response.data}");
  }

  // void AddBuktiBayar(File payment_img) async {
  //   try {
  //     var response = await post(
  //         Uri.parse(
  //             'https://paylater.harysusilo.my.id/api/instalment-store/id'),
  //         headers: {
  //           'Authorization': token,
  //         },
  //         body: {
  //           'payment_img': payment_img,
  //         });
  //
  //     if (response.statusCode == 200) {
  //       var responseData = json.decode(response.body);
  //       if (responseData['success'] == false) {
  //         print('gagal');
  //       } else {
  //         Navigator.of(context).pop();
  //         AlertDialog alert = AlertDialog(
  //           title: const Text("Berhasil"),
  //           content: Text(responseData['message']),
  //           actions: [
  //             TextButton(
  //               child: const Text('Ok'),
  //               onPressed: () => Navigator.of(context).pop(),
  //             ),
  //           ],
  //         );
  //
  //         showDialog(context: context, builder: (context) => alert);
  //       }
  //     } else {
  //       var responseData = json.decode(response.body);
  //       AlertDialog alert = AlertDialog(
  //         title: Text(responseData['message']),
  //         actions: [
  //           TextButton(
  //             child: const Text('Ok'),
  //             onPressed: () => Navigator.of(context).pop(),
  //           ),
  //         ],
  //       );
  //       showDialog(context: context, builder: (context) => alert);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3E9EB),
      appBar: AppBar(
        backgroundColor: const Color(0xff025464),
        title: const Text('Detail Pembayaran Cicilan'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
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
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  isOpen: true,
                  header: Text('Transfer Bank', style: _headerStyle),
                  contentBorderColor: const Color(0xff568D98),
                  headerBackgroundColor: const Color(0xff568D98),
                  headerBackgroundColorOpened: const Color(0xff2E8A99),
                  content: Accordion(
                    maxOpenSections: 1,
                    headerBackgroundColorOpened: Colors.black54,
                    headerPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    children: [
                      ///BCA
                      AccordionSection(
                        isOpen: true,
                        headerBackgroundColor: const Color(0xffCCDDE0),
                        headerBackgroundColorOpened: const Color(0xffCCDDE0),
                        contentBorderColor: const Color(0xff2E8A99),
                        rightIcon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff2E8A99)),
                        header: Text('BCA', style: _headerSubStyle),
                        content: Text(_bca, style: _contentStyle),
                        contentHorizontalPadding: 20,
                      ),

                      ///BRI
                      AccordionSection(
                        isOpen: true,
                        headerBackgroundColor: const Color(0xffCCDDE0),
                        headerBackgroundColorOpened: const Color(0xffCCDDE0),
                        contentBorderColor: const Color(0xff2E8A99),
                        rightIcon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff2E8A99)),
                        header: Text('BRI', style: _headerSubStyle),
                        content: Text(_bca, style: _contentStyle),
                        contentHorizontalPadding: 20,
                      ),

                      ///BTN
                      AccordionSection(
                        isOpen: true,
                        headerBackgroundColor: const Color(0xffCCDDE0),
                        headerBackgroundColorOpened: const Color(0xffCCDDE0),
                        contentBorderColor: const Color(0xff2E8A99),
                        rightIcon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff2E8A99)),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ID Pesanan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '12345678',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),

                  ///Tagihan Cicilan
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Tagihan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
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
                        ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff025464))),
                          onPressed: () => pickImage(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text('Upload'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///image
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffEBEBEB))),
                    ),
                    child: image != null
                        ? Image.file(
                            image!,
                            height: 200,
                            width: 120,
                            fit: BoxFit.cover,
                          )
                        : const Text(
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

            ///submit
            ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => {
                uploadImage(image)
              },
            ),
          ],
        ),
      ),
    );
  }
}
