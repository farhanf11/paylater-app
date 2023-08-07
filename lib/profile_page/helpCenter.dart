import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

/// Main example page
class HelpCenter extends StatelessWidget //__
{
  const HelpCenter({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _headerSubStyle = const TextStyle(color: Color(0xff025464), fontSize: 14, fontWeight: FontWeight.bold);

  final _contentStyle = const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
  final _apaItuIlkompay =
      '''IlkomPay merupakan Platform pembayaran belanja online yang menerapkan sistem PayLater. IlkomPay menghadirkan akad yang sesuai Syariat Islam, dan pastinya tanpa menerapkan bunga. Jadi dapat disimpulkan bahwa IlkomPay adalah Paylater Syariah.''';
  final _perbedaanIllkompay =
      '''IlkomPay tidak memiliki bunga atau denda telat bayar''';
  final _downloadIlkompay =
      '''Aplikasi IlkomPay dapat di download pada Google Playstore Android''';
  final _sesuaiSyariah =
        '''1.	Kami mengarah kepada Dewan Syariah MUI \n2. Proses IlkomPay menggunakan Paylater atau bayar di kemudian 	tanpa bunga \n3. Akad yang digunakan pada IlkomPay adalah Murabahah''';
  final _terdaftarOJK = '''IlkomPay merupakan platform jual beli online dengang sistem bayar di kemudian hari. Maka dari itu pembiayaan tidak perlu menggunakan OJK karena IlkomPay bukan Pinjaman Online dan tidak melayani peminjaman uang.''';
  final _menjadiPengguna =
        '''1. Download aplikasi IlkomPay di platform Android.
        \n2. Isi nomor telpon anda untuk mendaftar akun.
        \n3. Kode OTP otomatis terkirim melalui SMS ke nomor anda. 
        \n4. Masukkan kode OTP pada halaman verifikasi.
        \n5. Selamat, anda sudah terdaftar dan bisa menggunakan fasilitas IlkomPay setelah melakukan pengisian data diri''';
  final _syaratKonsumen = '''1.	Mahasiswa/Karyawan/Dosen Universita Negeri Jakarta (dibuktikan dengan KTM aktif atau ID Card KTP/SIM).
        \n2. Memiliki nomor kontak pribadi dan ahli waris (saudara kandung, orang tua, suami/istri).
        \n3. Memiliki dokumen KTP/SIM/NPWP/STNK/PASPOR.
        \n4. Memiliki kartu keluarga.
        \n5. Memiliki tempat tinggal tetap.''';
  final _dataInput = '''Ketetapan data konsumen yang di input, kami sudah menjabarkan penjelasan pada menu Privacy Policy pada halaman profile.''';
  final _hapusAkun = '''Pelanggan IlkomPay yang sudah terdaftar sebagai pengguna dapat mengajukan penghapusan akun dengan mengirimkan email pengajuan ke abcd@gmail.com. Penghapusan akun akan diproses dalam waktu 3x24jam setelah email dikonfirmasi dan akan terkirim otomatis email balasan apabila akun Ilkompay telah terhapus sistem.''';
  final _jatuhTempoCicilan = '''Pembayaran cicilan akan jatuh tempo pada setiap tanggal 5 dibulan berikutnya, dan 10 hari sebelum jatuh tempo akan diberitahukan dari pihak Ilkompay kepada customer melalui pesan email.''';
  final _paymentMethode = '''1. Bank BCA – 2132132134, A/N PT Ilkompay Syariah. \n2. Bank BRI – 12332422420003, A/N PT Ilkompay Syariah''';
  final _marketplacce = '''1. Tokopedia
  \n2. Shopee
  \n3. Lazada''';
  final _produkPengecualian = '''1.	Surat, Warkat Pos atau Kartu Pos
  \n2. Barang berbahaya yang dapat atau mudah meledak, menyala atau terbakar sendiri(dapat dikirim dengan handling khusus via cargo)
  \n3. Narkotika dan obat-obatan terlarang lainnya
  \n4. Kosmetik dan makanan minuman yang membahayakan keselamatan penggunanya, ataupun yang tidak mempunyai izin edar dari Badan Pengawas Obat dan Makanan (BPOM).
  \n5. Barang cetakan atau benda lainnya yang mengandung pornografi dan menyinggung kesusilaan.
  \n6. Barang cetakan / rekaman yang isinya dapat mengganggu keamanan dan ketertiban serta stabilitas nasional.
  \n7. Narkoba, Alkohol, minuman keras, zat NAPZA lainnya dan makanan basah.
  \n8. Tanaman dan hewan (dapat dikirim dengan handling khusus via cargo)
  \n9. Senjata api dan senjata tajam
  \n10. Perhiasan, batu akik / batu batuan berharga, materai dan perangko (persyaratan khusus)
  \n11. Uang tunai
  \n12. Perlengkapan dan peralatan judi
  \n13.	Barang yang diduga tidak jelas asal usul, spesifikasi dan harganya.''';


  @override
  build(context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff025464),
          title: const Text('Help Center'),
          leading: const BackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Accordion(
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
                header: Text('Tentang Aplikasi', style: _headerStyle),
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
                      header: Text('Apa Itu IlkomPay?', style: _headerSubStyle),
                      content: Text(_apaItuIlkompay, style: _contentStyle),
                      contentHorizontalPadding: 20,
                    ),
                    //download ilkompay
                    AccordionSection(
                      isOpen: false,
                      header: Text('Bagaimana cara menggunakan IlkomPay?',
                          style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text( _downloadIlkompay, style: _contentStyle),
                    ),

                    //sesuai syariah?
                    AccordionSection(
                      isOpen: false,
                      header: Text('Apakah IlkomPay sesuai dengan syariat islam?', style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text(_sesuaiSyariah, style: _contentStyle),
                    ),

                    //perbedaan
                    AccordionSection(
                      isOpen: true,
                      header: Text('Apa perbedaan IlkomPay dengan kartu kredit atau paylater konvensional?', style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text(_perbedaanIllkompay, style: _contentStyle),
                    ),

                    //ojk?
                    AccordionSection(
                      isOpen: true,
                      header: Text('Apakah IlkomPay terdaftar pada OJK?', style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text(_terdaftarOJK, style: _contentStyle),
                    ),
                  ],
                ),
              ),
              //Register Ilkompay
              AccordionSection(
                headerPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                isOpen: false,
                header: Text('Register IlkomPay', style: _headerStyle),
                contentBorderColor: const Color(0xff568D98),
                headerBackgroundColor: Color(0xff568D98),
                headerBackgroundColorOpened: Color(0xff2E8A99),
                content: Accordion(
                  maxOpenSections: 1,
                  headerBackgroundColorOpened: Colors.black54,
                  headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  children: [
                    //pengguna
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('Bagaimana cara menjadi pengguna IlkomPay?', style: _headerSubStyle),
                      content: Text(_menjadiPengguna, style: _contentStyle),
                      contentHorizontalPadding: 20,
                    ),
                    //syarat konsumen
                    AccordionSection(
                      isOpen: false,
                      header: Text('Apa saja persyaratan menjadi Konsumen IlkomPay?',
                          style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text( _syaratKonsumen, style: _contentStyle),
                    ),

                    //data
                    AccordionSection(
                      isOpen: false,
                      header: Text('Apakah data yang saya input di IlkomPay terjamin keamanan dan kerahasiaannya?', style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text(_dataInput, style: _contentStyle),
                    ),

                    //hapus akun
                    AccordionSection(
                      isOpen: true,
                      header: Text('Bagaimana cara menghapus akun IlkomPay?', style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text(_hapusAkun, style: _contentStyle),
                    ),
                  ],
                ),
              ),

              //Product Ilkompay
              AccordionSection(
                headerPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                isOpen: false,
                header: Text('Product IlkomPay', style: _headerStyle),
                contentBorderColor: const Color(0xff568D98),
                headerBackgroundColor: Color(0xff568D98),
                headerBackgroundColorOpened: Color(0xff2E8A99),
                content: Accordion(
                  maxOpenSections: 1,
                  headerBackgroundColorOpened: Colors.black54,
                  headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  children: [
                    //pengguna
                    AccordionSection(
                      isOpen: false,
                      header: Text('Produk dari marketplace apa saja yang dapat digunakan didalam aplikasi IlkomPay?', style: _headerSubStyle),
                      content: Text(_marketplacce, style: _contentStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                    ),
                    //syarat konsumen
                    AccordionSection(
                      isOpen: false,
                      header: Text('Barang apa saja yang tidak bisa dicicil di IlkomPay?',
                          style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text( _produkPengecualian, style: _contentStyle),
                    ),
                  ],
                ),
              ),

              //Payment Ilkompay
              AccordionSection(
                headerPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                isOpen: false,
                header: Text('Payment Ilkompay', style: _headerStyle),
                contentBorderColor: const Color(0xff568D98),
                headerBackgroundColor: Color(0xff568D98),
                headerBackgroundColorOpened: Color(0xff2E8A99),
                content: Accordion(
                  maxOpenSections: 1,
                  headerBackgroundColorOpened: Colors.black54,
                  headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  children: [
                    //payment methode
                    AccordionSection(
                      isOpen: true,
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      header: Text('Metode pembayaran yang digunakan IlkomPay?', style: _headerSubStyle),
                      content: Text(_paymentMethode, style: _contentStyle),
                      contentHorizontalPadding: 20,
                    ),
                    //jatuh tempo
                    AccordionSection(
                      isOpen: false,
                      header: Text('Kapan pembarayan cicilan saya jatuh tempo?',
                          style: _headerSubStyle),
                      headerBackgroundColor: Color(0xffCCDDE0),
                      headerBackgroundColorOpened: Color(0xffCCDDE0),
                      contentBorderColor: Color(0xff2E8A99),
                      rightIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xff2E8A99)),
                      content: Text( _jatuhTempoCicilan, style: _contentStyle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
} //__
