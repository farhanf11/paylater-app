class Transaksi {
  int userId;
  String name;
  String profileimg;
  int id;
  String imageUrl;
  String productName;
  int tenorCicilan;
  String statusTransaksi;
  int hargaCicilan;
  int hargaBarang;
  String tanggalPembayaran;
  String catatan;

  Transaksi({
    required this.userId,
    required this.name,
    required this.profileimg,
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.tenorCicilan,
    required this.statusTransaksi,
    required this.hargaCicilan,
    required this.hargaBarang,
    required this.tanggalPembayaran,
    required this.catatan,
  });
}
