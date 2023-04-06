class Tagihan {
  int id;
  String imageUrl;
  String productName;
  int tenorCicilan;
  String statusTagihan;
  int hargaCicilan;
  int hargaBarang;
  String tanggalJatuhTempo;


  Tagihan({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.tenorCicilan,
    required this.statusTagihan,
    required this.hargaCicilan,
    required this.hargaBarang,
    required this.tanggalJatuhTempo,
  });
}