import 'package:flutter/material.dart';

/// Main example page
class PrivacyPolicy extends StatelessWidget //__
    {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  build(context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Color(0xff025464),
      title: const Text('Kebijakan Privasi'),
      leading: const BackButton(),
    ),
    body: ListView(
      physics: const ClampingScrollPhysics(),
      children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
                  child: Text('''
        \n1. KETENTUAN PENGGUNAAN SITUS WEB
        \n1.1. Persyaratan ini (dan seluruh dokumen yang terkait dengan hal tersebut) menerangkan kepada Anda, sebagai klien (yang selanjutnya hanya akan disebut "Anda" saja) tentang persyaratan penggunaan aplikasi IlkomPay (aplikasi mobile), baik sebagai pengunjung atau sebagai anggota terdaftar. aplikasi mobile ini dioperasikan oleh PT. KREDIT SYARIAH INDONESIA (yang selanjutnya disebut dengan "kami").
        \n1.2. Bacalah persyaratan penggunaan ini dengan baik sebelum Anda menggunakan aplikasi mobile kami. Dengan menggunakan aplikasi mobile kami, berarti Anda telah menyetujui seluruh penafsiran, persyaratan dan ketentuan penggunaan situs ini (selanjutnya disebut dengan "Persyaratan" saja). Jika Anda tidak menyetujuinya, maka sebaiknya sesegera mungkin keluar dari aplikasi mobile ini dan menahan diri untuk tidak menggunakan aplikasi mobile ini kembali.
         \n
        \n2. INFORMASI TENTANG KAMI
        \n2.1. Kami terdaftar dengan nama di Negara Republik Indonesia dan telah mendaftarkan kantor kami yang beralamat di GDS Lt. 6 Universitas Negeri Jakarta 
        \n3. PENGGUNA APLIKASI MOBILE KAMI
        \n3.1. Anda bertanggung jawab sepenuhnya atas penggunaan Aplikasi Mobile ini baik bila Anda mengakses situs kami melalui perangkat komputer ("perangkat komputer" yang dimaksud termasuk akses dari telepon genggam). Dengan mengakses Aplikasi Mobile ini, siapa saja yang menggunakan perangkat komputer Anda setuju untuk terikat dengan persyaratan kami. Anda bertanggung jawab untuk memastikan semua orang yang mengakses Aplikasi Mobile kami melalui koneksi internet dan menggunakan perangkat komputer Anda, mengetahui dan mematuhi persyaratan kami.
        \n3.2. Aplikasi Mobile kami ditujukan untuk digunakan bagi Anda yang berusia 18 tahun atau lebih dan mengaksesnya dari Negara Republik Indonesia. Kami tidak dapat menjamin bahwa informasi yang berada pada Aplikasi Mobile ini memenuhi atau sesuai dengan peraturan di luar Republik Indonesia.
        \n3.3. Untuk terdaftar pada kami, atau mengajukan fasilitas pembiayaan kepada kami, Anda harus berusia 18 tahun atau lebih. Anda harus memastikan bahwa detail  informasi yang Anda berikan, baik pada saat registrasi maupun pendaftaran atau kapan saja saat Anda mengakses Aplikasi Mobile kami, haruslah akurat dan lengkap. Anda harus segera menginformasikan kepada kami jika ada perubahan dengan cara memperbaharui detail data pribadi Anda.
        \n3.4. Anda menyetujui bahwa Anda tidak akan secara tak sengaja mengirimkan virus atau apapun yang akan merusak Situs Web dan Aplikasi Mobile kami. Anda tidak diperkenankan untuk menggunakan program, perangkat atau software otomatis untuk mengganggu atau berusaha mengganggu sistem yang bekerja pada Aplikasi Mobile ini. Anda juga tidak diizinkan untuk menguraikan, mengkompilasi, membongkar, atau merekayasa balik setiap bagian dari perangkat lunak yang menyusun atau bagaimanapun membentuk Aplikasi Mobile ini.
         \n
        \n4. PENGAKSESAN APLIKASI MOBILE
        \n4.1. Akses pada aplikasi mobile ini diizinkan dengan persyaratan sementara, dan kami berhak untuk menarik atau mengubah layanan yang kami sediakan      di aplikasi mobile ini tanpa pemberitahuan. Kami tidak memberikan jaminan jika karena alasan apapun aplikasi mobile tidak tersedia setiap saat atau selama beberapa waktu
        \n4.2. Adakalanya kami melarang akses pada sebagian, atau keseluruhan aplikasi mobile bagi beberapa pengguna yang telah terdaftar. 
        \n4.3. Jika Anda memilih, atau telah disediakan, password atau informasi apapun sebagai bagian dari prosedur keamanan, maka Anda harus menyimpan informasi rahasia tersebut, dan tidak boleh memberikannya kepada pihak ketiga. Kami memiliki hak untuk menonaktifkan password pengguna, meskipun Anda telah menunjuk atau ditunjuk oleh kami, setiap saat, jika menurut kami Anda telah gagal untuk mematuhi mana saja ketetapan dari persyaratan ini.
         \n
        \n5. APLIKASI MOBILE PIHAK KETIGA
        \n5.1. aplikasi mobile ini ada kalanya terkait dengan aplikasi mobile lain. Keterkaitan tersebut diluar kendali dan tanggung jawab kami. Kami tidak menerima jaminan atas isi atau ketersediaan situs terkait yang tidak dioperasikan oleh kami. Kaitan pada aplikasi mobile kami, sediakan hanya untuk kenyamanan Anda dan kami tidak mengindikasikan kepercayaan atau persetujuan atas situs terkait. Untuk itu, Anda sebaiknya, selalu merujuk kepada syarat dan ketentuan yang ada pada situs terkait sebelum Anda menggunakan situs tersebut dan ajukanlah pertanyaan atau komentar Anda langsung kepada penyedia aplikasi mobile tersebut.
        \n5.2. Anda tidak diizinkan (dan juga Anda tidak diizinkan membantu orang lain) untuk membuat link dari aplikasi mobile Anda ke aplikasi mobile kami (kecuali program Affiliate) tanpa persetujuan tertulis, yang kami dapat berikan atau tolak sesuai dengan kebijakan kami. Anda tidak diizinkan untuk membuat tautan langsung ("Hot Link") terhadap konten atau gambar tanpa izin tertulis dari kami terlebih dahulu.
         \n
        \n6. SURAT ELEKTRONIK INTERNET
        \n6.1. Pesan yang disampaikan melalui koneksi internet tidak dapat dijamin sepenuhnya keamanannya, dan bisa saja tertahan, hilang atau mengalami perubahan. Kami tidak bertanggung jawab atas pesan yang hilang, diubah oleh pihak ketiga, atau tertahan dan kami tidak bertanggung jawab secara material kepada Anda atau siapa saja atas kerusakan atau hal lainnya sehubungan dengan pesan yang dikirim oleh Anda kepada kami atau kami kepada Anda melalui koneksi internet.
        \n6.2. Aplikasi Mobile ini menggunakan cookies, yang harus Anda setujui penggunaannya untuk menikmati fungsionalitas penuh dari Aplikasi Mobile ini. Cookies adalah file yang digunakan oleh peladen kami untuk mengidentifikasi komputer Anda. Cookies yang kami gunakan akan merekam bagian mana dari Situs Web Aplikasi Mobile ini yang Anda kunjungi dan berapa lama. Anda berhak untuk menolak penggunaan cookies dengan cara mengkonfigurasi web jelajah Anda. Mohon untuk diingat, bahwa konfigurasi tersebut bisa saja mengganggu beberapa fungsi dari Aplikasi Mobile ini. Untuk informasi lebih lanjut terkait penggunaan cookie ini, silahkan melihat bagian Kebijaksanaan Privasi kami.
         \n
        \n7. HAK KEKAYAAN INTELEKTUAL
        \n7.1. Aplikasi Mobile ini dimiliki oleh. Apapun dan seluruh hak kekayaan intelektual dalam situs web ini termasuk, namun tidak terbatas, pada hak cipta, dan hak basis, data serta seluruh logo atau merek dagang (apakah terdaftar ataupun tidak) menjadi milik dan properti tetap dari (atau lisensi pihak ketiga yang dipakai) sampai kapan pun juga.
        \n7.2. Anda diperbolehkan untuk melihat dan menyalin-cetak diatas kertas isi yang disediakan Aplikasi Mobile ini, namun:
        \n●	Seluruh dan salinan tersebut merupakan hak kekayaan intelektual dari kami.
        \n●	Anda tidak mengubah dengan cara apapun salinan kertas dari bahan-bahan yang telah dicetak, termasuk penghapusan segala hak cipta atau kepemilikan lainnya yang terkandung di Aplikasi Mobile.
        \n7.3. Anda setuju tidak akan menggunakan bagian manapun dari Aplikasi Mobile ini untuk:
        \n●	Menyelipkan atau dengan sengaja atau tidak sengaja menularkan atau menyebarkan virus, worm, trojan horse, time bomb, trap door atau kode komputer, berkas, atau program atau membuat permintaan berulang yang dirancang untuk mengganggu, merusak atau membatasi fungsi dari perangkat lunak, atau perangkat keras komputer, atau peralatan telekomunikasi, atau untuk mengurangi kualitas, mengganggu tampilan dari, atau merusak fungsi Aplikasi Mobile ini.
        \n●	Mengunggah, memasang, mengirimkan surel atau sebaliknya menerima, atau menempelkan tautan pada konten apapun yang memfasilitasi peretasan data
        \n●	Meretas apapun yang menjadi bagian dari Aplikasi Mobile ini
        \n●	Mengunggah, mengirimkan surel, atau mengirimkan tautan kepada konten mana saja yang melanggar hak kekayaan intelektual dari pihak ketiga
        \n●	Mengelakkan atau mencoba mengelakkan, cara pengamanan apapun dari Aplikasi Mobile, atau
        \n●	Mengizinkan pihak ketiga manapun untuk melakukan semua hal diatas.
        \n●	Jika Anda menggunakan konten dari Aplikasi Mobile ini namun gagal memenuhi persyaratan-persyaratan ini, maka hak Anda untuk menggunakan Aplikasi Mobile ini akan langsung hilang.
        \n●	Tidak ada tautan dari situs lain pada Aplikasi Mobile ini yang mungkin masuk tanpa izin tertulis dari kami terlebih dahulu. Anda tidak berhak memberi nama memodifikasi, atau membagikan kembali konten dari situs ini.
         \n
        \n8. PERLINDUNGAN DAN KERAHASIAAN DATA
        \n8.1. Keberadaan kami bisa merupakan hasil dari interaksi Anda dengan Aplikasi Mobile ini, dan mengadakan, serta memproses informasi yang diperoleh tentang Anda ketika Anda mengakses Aplikasi Mobile ini, dan menggunakannya untuk membuat keputusan fasilitas pembiayaan, dan hubungan pelayanan kami dengan Anda, demi fungsi pencegahan penipuan dan pengumpulan hutang, untuk mengetahui kebutuhan keuangan Anda, terkait dengan usaha kami dan untuk memberikan layanan pelanggan yang lebih baik dan produk yang tepat dari pihak ketiga, untuk mengevaluasi keefektifan dari pemasaran Situs Web kami, dan untuk analisa statistik. Kami mungkin meneruskan informasi kepada agen-agen kami, sesuai dengan ketentuan hukum, dan mereka juga dapat meneruskan informasi yang mereka miliki tentang Anda kepada kami, dan kami juga dapat melakukan hal yang sama. Kami tidak akan membuka informasi apapun diluar kecuali untuk kepentingan pencegahan penipuan dan/ atau bila diminta dan/ atau diwajibkan oleh hukum dan pemerintah, atau badan hukum, atau agen, atau lembaga berwenang di bawah aturan yang ada, atau di bawah kode rahasia untuk men subkontrakkan, atau orang yang bertindak sebagai agen kami atau apa saja yang kami beri wewenang.
        \n8.2. Dengan mendaftarkan semua informasi melalui aplikasi mobile ini, Anda setuju bahwa dapat menghubungi Anda kapan saja melalui surat, faksimili, surel ataupun telepon.
        \n8.3. Semua informasi yang dimasukkan dalam formulir pada situs ini disimpan dengan aman dan rahasia oleh sesuai dengan ketentuan perlindungan data lokal di Indonesia. Kami mensyaratkan semua pihak yang kami sampaikan informasi Anda untuk menyimpannya dengan tingkat kerahasiaan yang sama. Kami juga telah mengambil semua langkah yang wajar secara komersial untuk memastikan bahwa setiap informasi yang dikirimkan pada website dilindungi dan dienkripsi termasuk namun tidak terbatas pada penggunaan teknologi SSL / TLS yang tersedia untuk penggunaan komersial.
        \n8.4. Kami menjaga privasi data yang sangat serius. Anda dapat meninjau kebijakan privasi kami rinci dengan menghubungi kami di contact@ilkompay.com untuk informasi lebih lanjut tentang bagaimana kami menangani atau memproses informasi pribadi Anda.
         \n
        \n9. PENAFSIRAN DAN PEMBATASAN
        \n9.1. Kami telah mengambil langkah yang bertanggung jawab untuk memastikan keakuratan, ketepatan, kebenaran dan kelengkapan informasi dari Aplikasi Mobile ini. Namun, bagaimanapun juga, informasi yang ada pada aplikasi mobile ini, dan disebut dengan “sebagaimana yang ada” atau “sebagaimana arti” hanya merupakan dasar, dan kami tidak memberikan jaminan atau mewakili apapun, meskipun hal tersebut terlihat jelas atau tersirat.
        \n9.2. Penggunaan dari Aplikasi Mobile ini dan informasi yang terkandung didalamnya adalah tanggung jawab risiko Anda sendiri. Kami tidak menjamin kehilangan atau kerusakan, apakah langsung atau tidak langsung, sebagai akibat atau sebaliknya, yang mungkin membuat Anda kesulitan untuk menggunakan Aplikasi Mobile ini; termasuk, namun tidak terbatas pada layanan komputer, atau kegagalan sistem, akses yang tertunda, atau terganggu, data yang tidak terkirim atau salah pengiriman virus komputer, atau komponen lain yang merusak, melanggar keamanan, atau sistem tak bertanggung jawab yang berasal dari datangnya "peretas" atau sebaliknya, atau kepercayaan Anda pada informasi yang ada pada Aplikasi Mobile ini.
        \n9.3. Kami tidak mewakili atau menjamin Aplikasi Mobile ini selalu tersedia dan memenuhi kebutuhan Anda, seperti terganggunya akses, tidak akan adanya penundaan, kegagalan, eror atau penghilangan atau kehilangan dari informasi yang dikirimkan; tidak akan ada virus atau kontaminasi atau hal-hal yang merusak, tidak akan terkirim atau tidak akan ada kerusakan pada sistem komputer Anda. Anda bertanggung jawab sendiri untuk perlindungan yang sesuai atas data dan atau peralatan, dan untuk mengambil tindakan yang bertanggung jawab dan sesuai sebagai pencegahan dan memindai virus komputer atau hal-hal perusak lainnya.
        \n9.4. Kami tidak membuat perwakilan atau garansi terkait dengan keakuratan, fungsi, tampilan perangkat lunak dari pihak ketiga manapun yang mungkin digunakan untuk koneksi pada aplikasi Mobile ini.
         \n
        \n10. PERATURAN PEMERINTAH
        \n10.1. Persyaratan ini ditentukan dan diterjemahkan sesuai dengan peraturan pemerintah Republik Indonesia. Pihak-pihak yang dengan ini, tunduk kepada yurisdiksi non-eksklusif dari Pengadilan Negeri Jakarta Selatan. Meskipun begitu perjanjian ini bisa saja berlaku di pengadilan manapun di setiap yurisdiksi yang kompeten seperti yang kami dapat tentukan sewaktu-waktu.
        \n 
        \n11. PELEPASAN
        \n11.1. Kegagalan kami untuk menggunakan atau menunda dalam melaksanakan hak, kekuasaan atau hak istimewa berdasarkan Perjanjian ini bukanlah sebuah pengabaian; begitu juga terhalangnya salah satu atau sebagian dari hak, kekuasaan atau hak istimewa manapun atau penggunaannya.
      '''),
                ),
      ],
    ),
  );
} //__
