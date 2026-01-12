import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VisiMisiPage extends StatelessWidget {
  const VisiMisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EFFF),
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
          'Visi & Misi',
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

            _title('VISI'),
            const SizedBox(height: 8),
            _content(
              'Visi keilmuan di Program Studi D3 Manajemen Informatika yaitu '
                  '“Tahun 2030 menjadi Program Studi D3 Manajemen Informatika kelas '
                  'Dunia yang Unggul dalam Bidang Pengembangan Aplikasi berbasis '
                  'Mobile, Website, dan Multimedia Interaktif untuk mendukung '
                  'ekonomi kreatif berbasis entrepreneurship.”',
            ),

            const SizedBox(height: 24),

            _title('MISI'),
            const SizedBox(height: 8),

            unggulSection(
              number: 1,
              title: 'Unggul dalam manajemen dan pelayanan',
              items: [
                'Melaksanakan kegiatan layanan administrasi yang profesional.',
                'Menggunakan kontrol kualitas jaminan mutu untuk memastikan bahwa pelaksanaan Tri Darma perguruan tinggi sudah berjalan secara benar dan profesional.',
              ],
            ),

            unggulSection(
              number: 2,
              title: 'Unggul dalam bidang pendidikan',
              items: [
                'Melaksanakan dan mengembangkan pendidikan tinggi yang berkualitas, produktif dan profesional.',
                'Membangun suasana akademik yang kondusif untuk mendukung proses belajar mengajar, pembinaan individu, dan pengembangan karakter.',
                'Mendorong upaya peningkatan kualitas sumber daya manusia (mahasiswa, dosen dan karyawan) melalui pendidikan berkelanjutan, agar berwawasan luas, memiliki perspektif global, dan pemahaman kondisi lingkungan yang benar.',
                'Meningkatkan pemahaman dalam pemanfaatan teknologi informasi dan penguasaan di bidang manajemen informatika, khususnya pada konsentrasi Mobile Programming, Web Programming, dan Interactive Multimedia berbasis entrepreneurship.',
              ],
            ),

            unggulSection(
              number: 3,
              title: 'Unggul dalam penelitian',
              items: [
                'Melaksanakan penelitian dalam rangka pengembangan ilmu pengetahuan.',
                'Mendorong tumbuhnya kreatifitas untuk menghasilkan karya-karya dibidang teknologi informasi, khususnya sistem informasi, yang bermanfaat bagi kehidupan masyarakat.',
                'Mendapatkan pengakuan nasional dan internasional dalam bidang penelitian dengan menghasilkan karya baru yang sesuai konsentrasi bidang ilmu Mobile Programming, Web Programming, dan Interactive Multimedia atau interdisiplin ilmu berbasis entrepreneurship.',
              ],
            ),

            unggulSection(
              number: 4,
              title: 'Unggul dalam pengabdian masyarakat',
              items: [
                'Melaksanakan pengabdian kepada masyarakat.',
                'Melaksanakan pembinaan sivitas akademika dan mendorong terciptanya hubungan yang erat dan baik dengan lingkungan.',
                'Menerapkan keahlian teknologi informasi khususnya dalam bidang manajemen informatika untuk menghasilkan aplikasi yang bermanfaat dan mudah digunakan oleh masyarakat IT dan masyarakat umum berbasis entrepreneurship.',
                'Menyediakan SDM berkualitas tinggi yang mampu bekerja diberbagai bidang, mampu mempromosikan terobosan-terobosan baru dibidang sistem informasi, dan tetap konsisten mengupayakan peningkatan kesejahteraan masyarakat.',
              ],
            ),




          ],
        ),
      ),

      bottomNavigationBar: _footer(),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF4C21A4),
      ),
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
