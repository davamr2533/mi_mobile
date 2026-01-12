import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilProdiPage extends StatelessWidget {
  const ProfilProdiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF330065),
        leading: IconButton(
          icon: const Icon(Icons.reply, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profil Prodi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== HEADER =====
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

            const SizedBox(height: 4),

            Center(
              child: Transform.translate(
                offset: const Offset(0, -12),
                child: SizedBox(
                  width: 280,
                  child: Divider(
                    color: const Color(0xFFFCC740),
                    thickness: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),


            _content(
              'Program Studi Diploma Tiga Manajemen Informatika (D3-MI)'
                  'merupakan salah satu program studi pendidikan tinggi vokasi '
                  'yang berada di bawah pengelolaan Fakultas Ilmu Komputer, '
                  'Universitas Amikom Yogyakarta. Prodi D3MI terdaftar sejak tahun 1994 melalui '
                  'Surat Keputusan Menteri Pendidikan dan Kebudayaan Republik Indonesia Nomor 084/D/O/1994. '
                  'Berdasarkan SK No.056/SK/LAM-INFOKOM/Ak/D3/III/2025, Prodi D3 Manajemen Informatika '
                  'mendapatkan akreditasi UNGGUL hingga tahun 2030. Prodi D3MI memiliki 3 konsentrasi '
                  'keahlian yang menjadi penciri dan program keunggulan Prodi yaitu: Mobile Programming, '
                  'Web Programming, dan Interactive Multimedia.',
            ),
            const SizedBox(height: 20),

            _content(
              'Guna memenuhi kebutuhan tenaga kerja '
                  'profesional di bidang Teknologi informasi di tingkat nasional maupun internasional. '
                  'Program Studi Diploma-3 Manajemen Informatika siap menghasilkan tenaga kerja profesional '
                  'di bidang rekayasa perangkat lunak dengan kompetensi Mobile Programming, Web Programming, '
                  'dan Interactive Multimedia yang mampu berinovasi, kreatif dan mandiri.',
            ),
            const SizedBox(height: 20),

            _content(
              'Berbekalkan dasar-dasar matematika dan logika secara '
                  'terstruktur lulusan D3 Manajemen Informatika mampu menghasilkan karya aplikatif di bidang teknologi '
                  'informasi, mampu menerapkan prinsip-prinsip metode ilmiah untuk menghasilkan karya teknologi '
                  'informasi dan mampu menyelesaikan masalah praktis di bidang teknologi informasi melalui rekayasa perangkat lunak sesuai standar industri. ',
            ),
            const SizedBox(height: 20),

            _content(
                  'Program Studi D3-MI menjalankan perencanaan pembelajaran, proses pembelajaran, dan penilaian pembelajaran '
                  'sesuai dengan kurikulum berbasis Outcome-Based Education (OBE) dan sesuai dengan jenjang Kerangka '
                  'Kualifikasi Nasional Indonesia (KKNI) untuk program Diploma Tiga (D3). Suasana akademik, mekanisme integrasi '
                  'topik penelitian dan pengabdian kepada masyarakat ke dalam proses pembelajaran, '
                  'proses evaluasi kurikulum, serta proses penyelesaian tugas akhir sudah berjalan dengan baik. Rata-rata kelulusan '
                  'tepat waktu mahasiswa diatas 50% tiap tahunnya dengan program andalan magang yang dapat diteruskan '
                  'menjadi Tugas Akhir dan kuliah konsentrasi yang terfokus sejak semester II. Sehingga lulusan D3 manajemen Informatika'
                  ' dapat dikatakan "matang pohon" dan siap bersaing di dunia kerja dan industri setelah lulus.',
            ),
            const SizedBox(height: 20),

            _content(
              'Rata-rata kelulusan tepat waktu mahasiswa diatas 50% tiap tahunnya dengan program andalan magang yang dapat diteruskan '
                  'menjadi Tugas Akhir dan kuliah konsentrasi yang terfokus sejak semester II. Sehingga lulusan D3 manajemen Informatika'
                  ' dapat dikatakan "matang pohon" dan siap bersaing di dunia kerja dan industri setelah lulus.',
            ),
            const SizedBox(height: 12),






          ],
        ),
      ),

      bottomNavigationBar: _footer(),
    );
  }


  Widget _content(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(fontSize: 15),
      textAlign: TextAlign.justify,
    );
  }

  Widget unggulSection({
    required int number,
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul utama (1. Unggul dalam ...)
        Text(
          '$number. $title',
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        // List a, b, c
        ...List.generate(items.length, (index) {
          final huruf = String.fromCharCode(97 + index); // a, b, c
          return Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$huruf. ',
                    style: GoogleFonts.roboto(fontSize: 14)),
                Expanded(
                  child: Text(
                    items[index],
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF4C21A4), // background footer

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FaIcon(
            FontAwesomeIcons.instagram,
            size: 20,
            color: Colors.white,
          ),

          SizedBox(width: 6),
          Text('mi.amikom', style: TextStyle(color: Colors.white),),
          SizedBox(width: 24),
          Icon(Icons.language, size: 20, color: Colors.white,),
          SizedBox(width: 6),
          Text('mi.amikom.ac.id', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }



}
