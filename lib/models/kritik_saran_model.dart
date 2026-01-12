class KritikSaran {
  final int id;
  final String nama;
  final String nim;
  final String kritikSaran;
  final DateTime createdAt;

  KritikSaran({
    required this.id,
    required this.nama,
    required this.nim,
    required this.kritikSaran,
    required this.createdAt,
  });

  factory KritikSaran.fromJson(Map<String, dynamic> json) {
    return KritikSaran(
      id: json['id'],
      nama: json['nama'],
      nim: json['nim'],
      kritikSaran: json['kritik_saran'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
