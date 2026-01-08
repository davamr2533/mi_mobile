import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_mobile/pages/konsentrasi.dart';
import 'package:mi_mobile/pages/profil_prodi.dart';
import 'package:mi_mobile/pages/visi_misi.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D3 Manajemen Informatika',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F3FF),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF330065),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            //Logo putih amikom
            Image.asset(
              'assets/images/amikom_putih.png',
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),

            // Garis pembatas
            Container(
              width: 1,
              height: 24,
              color: Colors.white70,
            ),

            const SizedBox(width: 12),
            const Text(
              'D3 Manajemen Informatika',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            color: const Color(0xFFFCC740),
            onSelected: (value) {
              if (value == 'login') {

              } else if (value == 'logout') {


              }
            },
            itemBuilder: (context) => [

              PopupMenuItem(
                value: 'login',
                child: Row(
                  children: [
                    Icon(Icons.login, size: 18),
                    SizedBox(width: 8),
                    Text('Log in'),
                  ],
                ),
              ),

              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 18),
                    SizedBox(width: 8),
                    Text('Log out'),
                  ],
                ),
              ),
            ],

          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [

            _header(),
            const SizedBox(height: 30),

            //Tombol baris pertama
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                  icon: Icons.track_changes,
                  label: 'VISI MISI',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VisiMisiPage()
                        )
                    );
                  },
                ),

                SizedBox(width: 20),

                MenuButton(
                  icon: Icons.computer,
                  label: 'KONSENTRASI',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KonsentrasiPage()
                        )
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            //Tombol baris kedua
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                  icon: Icons.business,
                  label: 'PROFIL PRODI',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilProdiPage()
                        )
                    );
                  },
                ),

                SizedBox(width: 20),

                MenuButton(
                  icon: Icons.people,
                  label: 'PROFIL DOSEN',
                  onPressed: () {

                  },
                ),
              ],
            ),

            const SizedBox(height: 60),

            _button(
              text: 'Kritik dan Saran',
              color: const Color(0xFF4C21A4),
            ),
            const SizedBox(height: 12),

            _button(
              text: 'Survey Kepuasan',
              color: const Color(0xFF4C21A4),
            ),



          ],
        ),
      ),

      bottomNavigationBar: _footer(),

    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: Color(0xFF4C21A4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Congratulation!',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'PROGRAM STUDI D3 MANAJEMEN\nINFORMATIKA',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Image.asset(
              'assets/images/akreditasi_unggul.png',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }



  Widget _button({required String text, required Color color}) {
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
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
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

}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const MenuButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(155, 80),
        maximumSize: const Size(155, 80),
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: const Color(0xFF330065),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF330065),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}



