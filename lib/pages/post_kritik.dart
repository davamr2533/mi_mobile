import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_mobile/services/kritik_saran_services.dart';


class PostKritikPage extends StatefulWidget {
  const PostKritikPage({super.key});

  @override
  State<PostKritikPage> createState() => _PostKritikPageState();
}

class _PostKritikPageState extends State<PostKritikPage> {

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController kritikController = TextEditingController();


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
          'Kritik dan Saran',
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

            SizedBox(height: 12),

            Center(
              child: Text(
                "D3 Manajemen Informatika",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C21A4)
                ),
              ),
            ),

            Center(
              child: Transform.translate(
                offset: const Offset(0, -8), // (x, y) → y minus = naik
                child: SizedBox(
                  width: 280,
                  child: Divider(
                    color: Color(0xFFFCC740),
                    thickness: 2,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ===== NAMA =========================================
                  const Text(
                    'Nama',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),

                  TextField(
                    controller: namaController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Nama anda',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      filled: true,
                      fillColor: const Color(0xFFFFE8B3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ===== NIM =========================================
                  const Text(
                    'NIM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 6),

                  TextField(
                    controller: nimController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan NIM anda',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      filled: true,
                      fillColor: const Color(0xFFFFE8B3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ===== KRITIK DAN SARAN =========================================
                  const Text(
                    'Kritik dan Saran',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 6),

                  TextField(
                    controller: kritikController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kritik dan Saran',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      filled: true,
                      fillColor: const Color(0xFFFFE8B3),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            //Tombol kirim ===================================================
            _button(
              text: 'Kirim',
              color: const Color(0xFF4C21A4),
              onPressed: () {
                kirimKritik();
              },
            ),

          ],
        ),
      ),

      bottomNavigationBar: _footer(),
    );
  }



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




  //Fungsi untuk kirim kritik dan saran ke database
  Future<void> kirimKritik() async {

    //Logic jika data belum lengkap tapi sudah dikirim
    if (namaController.text.trim().isEmpty ||
        nimController.text.trim().isEmpty ||
        kritikController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Lengkapi semua data terlebih dahulu',
            style: TextStyle(
              fontSize: 16
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await KritikSaranService.kirimKritik(
        nama: namaController.text,
        nim: nimController.text,
        kritikSaran: kritikController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kritik & saran berhasil dikirim',
            style: TextStyle(
                fontSize: 16
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
      );

      namaController.clear();
      nimController.clear();
      kritikController.clear();

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal mengirim Kritik dan Saran',
            style: TextStyle(
                fontSize: 16
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }





}
