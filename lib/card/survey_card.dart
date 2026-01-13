import 'package:flutter/material.dart';

class SurveyCard extends StatelessWidget {
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

  const SurveyCard({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE8B3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ===== HEADER =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Text(
                  'NIM : $nim',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 6, top: 6),
            child: Text(
              'Semester $semester',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
          ),

          const Divider(color: Colors.black54),

          // ===== RINGKASAN =====



          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: _chip('Kemampuan Dosen', q1),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: _chip('Respon Prodi', q9),
          ),


          const SizedBox(height: 6),

          // ===== DETAIL =====
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 10),
              title: const Text(
                'Detail Jawaban',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              childrenPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                _item('Kemampuan Dosen', q1),
                _item('RPS di Awal', q2),
                _item('Materi sesuai RPS', q3),
                _item('Kroscek Nilai', q4),
                _item('Forum Diskusi', q5),
                _item('Daya Tanggap', q6),
                _item('Kepedulian Prodi', q7),
                _item('Konseling Dosen Wali', q8),
                _item('Respon Prodi', q9),
                _item('Keyakinan Pelayanan', q10),
                _item('Sarana & Prasarana', q11),
              ],
            ),
          ),


          const Divider(color: Colors.black45),

          // ===== CATATAN =====
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mata Kuliah Belum Maksimal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(mkTidakMaksimal),

                const SizedBox(height: 12),

                const Text(
                  'Saran Mahasiswa',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(saran),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===== CHIP =====
  Widget _chip(String label, String value) {
    return Chip(
      backgroundColor: const Color(0xFFFFD24C),
      label: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  // ===== ITEM DETAIL =====
  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(title)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
