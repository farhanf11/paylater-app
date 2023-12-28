import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paylater/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class DetailPembayaran extends StatefulWidget {
  const DetailPembayaran({Key? key,
    required this.order_id,
    required this.instalment_id}) : super(key: key);

  final int order_id;
  final int instalment_id;

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();
}

class _DetailPembayaranState extends State<DetailPembayaran> {
  ImagePicker picker = ImagePicker();
  File? image;
  Dio dio = Dio();
  String token = "";
  var order_id = 0;
  var instalment_id = 0;

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

  uploadImage(File? image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token')!;
      print(widget.instalment_id);
      print(widget.order_id);
    });
    var id = prefs.getInt('id')!;
    var formData = FormData();
    formData.fields.add(MapEntry("order_id", "${widget.order_id}"));
    formData.fields.add(MapEntry("instalment_id", "${widget.instalment_id}"));
    formData.files.add(MapEntry(
      "payment_img",
      await MultipartFile.fromFile(image!.path, filename: "pic-name.png"),
    ));
    var response = await dio.post(
        'https://paylater.harysusilo.my.id/api/instalment-store/$id',
        data: formData,
        options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization': token,
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }
        )
    );
    print("response data : ${response.data}");
    if (response.data['success'] == false) {
      Navigator.pop(context);
      AlertDialog alert = const AlertDialog(
        icon: Icon(CupertinoIcons.checkmark_seal_fill, size: 20, color: PaylaterTheme.maincolor, ),
        title: Text("Berhasil"),
        content: Text("berhasil melakukan pembayaran"),
      );

      showDialog(context: context, builder: (context) => alert);
    }
    print("response ${response.data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3E9EB),
      appBar: AppBar(
        backgroundColor: const Color(0xff025464),
        title: const Text('Detail Pembayaran Cicilan'),
        leading: const BackButton(),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
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
                ///ID Pesanan
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
                        'Upload Bukti',
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
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.drive_folder_upload_outlined, size: 20, color: PaylaterTheme.white,
                          ),
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
                    height: 300,
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

          const SizedBox(height: 40,),

          ///submit
          ElevatedButton(
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 60, vertical: 12)),
              backgroundColor: MaterialStatePropertyAll(Color(0xff025464)),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => {
              uploadImage(image),
            },
          ),
        ],
      ),
    );
  }
}
