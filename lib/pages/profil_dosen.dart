import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_mobile/card/dosen_card.dart';

class ProfilDosenPage extends StatelessWidget {
  const ProfilDosenPage({super.key});

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
          'Profil Dosen',
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

            Center(
              child: Text(
                "D3 Manajemen Informatika",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C21A4)
                ),
              ),
            ),

            SizedBox(height: 12),


            DosenCard(
              imagePath: 'assets/images/1_alan.png',
              nama: 'Akhmad Dahlan, M.Kom',
              nidn: '190302174',
            ),

            DosenCard(
              imagePath: 'assets/images/2_farida.png',
              nama: 'Lilis Dwi Farida, S.Kom, M.Eng',
              nidn: '190302288',
            ),

            DosenCard(
              imagePath: 'assets/images/3_dewi.png',
              nama: 'Dewi Anisa Istiqomah, S.Pd., M.Cs',
              nidn: '190302xxx',
            ),


          ],
        ),
      ),

      bottomNavigationBar: _footer(),
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
