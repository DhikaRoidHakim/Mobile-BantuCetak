class CetakDocument {
  final String nodokumen;
  final String referensi;
  final String nama;
  final String norek;
  final String tanggal;
  final int saldoawal;
  final int setoran;
  final int saldoakhir;

  CetakDocument({
    required this.nodokumen,
    required this.referensi,
    required this.nama,
    required this.norek,
    required this.tanggal,
    required this.saldoawal,
    required this.setoran,
    required this.saldoakhir,
  });

  factory CetakDocument.fromJson(Map<String, dynamic> json) {
    return CetakDocument(
      nodokumen: json['nodokumen'] ?? '',
      referensi: json['referensi'] ?? '',
      nama: json['nama'] ?? '',
      norek: json['norek'] ?? '',
      tanggal: json['tanggal'] ?? '',
      saldoawal: json['saldoawal'] ?? 0,
      setoran: json['setoran'] ?? 0,
      saldoakhir: json['saldoakhir'] ?? 0,
    );
  }
}
