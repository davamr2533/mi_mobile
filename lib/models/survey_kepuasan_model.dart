class SurveyKepuasan {
  final int id;
  final String nama;
  final String nim;
  final String semester;
  final String q1;
  final String q2;
  final String q3;
  final String q4;
  final String q5;
  final String q6;
  final String q7;
  final String q8;
  final String q9;
  final String q10;
  final String q11;
  final String mkTidakMaksimal;
  final String saran;
  final DateTime createdAt;

  SurveyKepuasan({
    required this.id,
    required this.nama,
    required this.nim,
    required this.semester,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.q7,
    required this.q8,
    required this.q9,
    required this.q10,
    required this.q11,
    required this.mkTidakMaksimal,
    required this.saran,
    required this.createdAt,
  });

  factory SurveyKepuasan.fromJson(Map<String, dynamic> json) {
    return SurveyKepuasan(
      id: json['id'] ?? '-',
      nama: json['nama'] ?? '-',
      nim: json['nim'] ?? '-',
      semester: json['semester'] ?? '-',
      q1: json['q1'] ?? '-',
      q2: json['q2'] ?? '-',
      q3: json['q3'] ?? '-',
      q4: json['q4'] ?? '-',
      q5: json['q5'] ?? '-',
      q6: json['q6'] ?? '-',
      q7: json['q7'] ?? '-',
      q8: json['q8'] ?? '-',
      q9: json['q9'] ?? '-',
      q10: json['q10'] ?? '-',
      q11: json['q11'] ?? '-',
      mkTidakMaksimal: json['mk_tidak_maksimal'] ?? '-',
      saran: json['saran'] ?? '-',
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
