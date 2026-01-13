import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_mobile/main.dart';
import 'package:mi_mobile/pages/get_kritik.dart';
import 'package:mi_mobile/pages/get_survey.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Anda sudah login'),
                    duration: Duration(seconds: 2),
                  ),
                );

              } else if (value == 'logout') {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );

              }
            },
            itemBuilder: (context) => [

              PopupMenuItem(
                value: 'login',
                child: Row(
                  children: [
                    Icon(Icons.login, size: 18, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Log in',style: TextStyle(color: Colors.grey)),
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
      body: Center(
        child: Column(
          children: [
            _header(),

            const SizedBox(height: 100),

            _button(
              text: 'Kritik dan Saran',
              color: const Color(0xFF4C21A4),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GetKritikSaranPage(),
                  ),
                );
              }
            ),
            const SizedBox(height: 21),

            _button(
              text: 'Survey Kepuasan',
              color: const Color(0xFF4C21A4),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetSurveyKepuasanPage(),
                    ),
                  );
                }
            ),
          ],
        )
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


}
