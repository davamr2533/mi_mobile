import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostSurveyPage extends StatefulWidget {
  const PostSurveyPage({super.key});

  @override
  State<PostSurveyPage> createState() => _PostSurveyPageState();
}

class _PostSurveyPageState extends State<PostSurveyPage> {

  final List<String> opsiKualitas = [
    'Sangat Baik',
    'Baik',
    'Cukup',
    'Kurang',
  ];

  final List<String> opsiPersentase = [
    'Di atas 75%',
    '50% - 75%',
    '25% - 50%',
    'Di bawah 25%',
  ];

  final List<String> opsiFrekuensi = [
    'Selalu',
    'Sering',
    'Jarang',
    'Tidak Pernah',
  ];

  final List<String> opsiFrekuensiIntens = [
    'Sering Sekali',
    'Sering',
    'Jarang',
    'Tidak Pernah',
  ];

  final List<String> opsiRespon = [
    'Ditanggapi dalam hitungan menit',
    'Ditanggapi dalam hitungan jam',
    'Ditanggapi dalam hitungan hari',
    'Ditanggapi setelah berbulan-bulan',
  ];

  final List<String> opsiKeyakinan = [
    'Sangat Yakin',
    'Yakin',
    'Cukup Yakin',
    'Ragu',
  ];


  String q1 = 'Sangat Baik';
  String q2 = 'Di atas 75%';
  String q3 = 'Selalu';
  String q4 = 'Sering Sekali';
  String q5 = 'Ditanggapi dalam hitungan menit';
  String q6 = 'Sangat Yakin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF330065),
        leading: IconButton(
          icon: const Icon(Icons.reply, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Survey Kepuasan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 12),

            Center(
              child: Text(
                "D3 Manajemen Informatika",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4C21A4),
                ),
              ),
            ),

            Center(
              child: Transform.translate(
                offset: const Offset(0, -8),
                child: const SizedBox(
                  width: 280,
                  child: Divider(
                    color: Color(0xFFFCC740),
                    thickness: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            _label('Bagaimana kemampuan / kehandalan dosen, tenaga pendidik dan pimpinan prodi dalam melayani mahasiswa ?'),
            _dropdown(
              value: q1,
              items: opsiKualitas,
              onChanged: (value) => setState(() => q1 = value!),
            ),

            const SizedBox(height: 40),

            _label('Ada berapa banyak dosen yang menyampaikan Rencana Pembelajaran Semester (RPS) di awal perkuliahan di semester ini ?'),
            _dropdown(
              value: q2,
              items: opsiPersentase,
              onChanged: (value) => setState(() => q2 = value!),
            ),

            const SizedBox(height: 40),

            _label('Ada berapa banyak dosen yang menyampaikan materi, tugas, dan ujian sesuai dengan RPS yang sudah diinfokan ?'),
            _dropdown(
              value: q2,
              items: opsiPersentase,
              onChanged: (value) => setState(() => q2 = value!),
            ),

            const SizedBox(height: 40),

            _label('Ada berapa banyak dosen yang menyediakan waktu untuk krosscheck nilai ?'),
            _dropdown(
              value: q2,
              items: opsiPersentase,
              onChanged: (value) => setState(() => q2 = value!),
            ),

            const SizedBox(height: 40),

            _label('Ada berapa banyak dosen yang menyediakan waktu atau forum untuk diskusi selama perkuliahan ?'),
            _dropdown(
              value: q2,
              items: opsiPersentase,
              onChanged: (value) => setState(() => q2 = value!),
            ),

            const SizedBox(height: 40),

            _label('Tuliskan mata kuliah yang dianggap belum maksimal dalam proses kegiatan belajar mengajar di semester ini'),

            const SizedBox(height: 6),

            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Tuliskan mata kuliah',
                filled: true,
                fillColor: const Color(0xFFFFE8B3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 40),

            _label('Bagaimana daya tanggap dan kemauan dosen, tenaga pendidik dan pimpinan prodi dalam membantu permasalahan mahasiswa?'),
            _dropdown(
              value: q1,
              items: opsiKualitas,
              onChanged: (value) => setState(() => q1 = value!),
            ),

            const SizedBox(height: 40),

            _label('Apakah dosen, tenaga pendidik dan pimpinan prodi selalu memberi perhatian dan peduli kepada mahasiswa?'),
            _dropdown(
              value: q3,
              items: opsiFrekuensi,
              onChanged: (value) => setState(() => q3 = value!),
            ),

            const SizedBox(height: 40),

            _label('Sebarapa sering dosen wali membuka sesi konseling atau menanyakan kabar anda ?'),
            _dropdown(
              value: q4,
              items: opsiFrekuensiIntens,
              onChanged: (value) => setState(() => q4 = value!),
            ),

            const SizedBox(height: 40),

            _label('Seberapa cepat pimpinan prodi dalam menanggapi email, chat, sms, atau pesan yang anda kirimkan melalui kontak resmi prodi'),
            _dropdown(
              value: q5,
              items: opsiRespon,
              onChanged: (value) => setState(() => q5 = value!),
            ),

            const SizedBox(height: 40),

            _label('Apakah anda merasa yakin bahwa pelayanan yang diberikan oleh prodi telah sesuai dengan ketentuan yang berlaku?'),
            _dropdown(
              value: q6,
              items: opsiKeyakinan,
              onChanged: (value) => setState(() => q6 = value!),
            ),

            const SizedBox(height: 40),

            _label('Bagaimana pendapat anda mengenai kecukupan, aksesibitas, serta kualitas sarana dan prasarana yang disediakan oleh prodi?'),
            _dropdown(
              value: q1,
              items: opsiKualitas,
              onChanged: (value) => setState(() => q1 = value!),
            ),

            const SizedBox(height: 40),

            _label('Saran untuk prodi D3 Manajemen Informatika'),

            const SizedBox(height: 8),

            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Tuliskan saran',
                filled: true,
                fillColor: const Color(0xFFFFE8B3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),





            const SizedBox(height: 60),

            _button(
              text: 'Kirim',
              color: const Color(0xFF4C21A4),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Survey berhasil dikirim'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: _footer(),
    );
  }

  // ===== LABEL =====
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  // ===== DROPDOWN =====
  Widget _dropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE8B3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4C21A4)),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }


  // ===== BUTTON =====
  Widget _button({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ===== FOOTER =====
  Widget _footer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: const Color(0xFF4C21A4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FaIcon(FontAwesomeIcons.instagram, size: 20, color: Colors.white),
          SizedBox(width: 6),
          Text('mi.amikom', style: TextStyle(color: Colors.white)),
          SizedBox(width: 24),
          Icon(Icons.language, size: 20, color: Colors.white),
          SizedBox(width: 6),
          Text('mi.amikom.ac.id', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
