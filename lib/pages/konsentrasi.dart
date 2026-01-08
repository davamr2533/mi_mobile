import 'package:flutter/material.dart';
import 'package:mi_mobile/card/konsentrasi_card.dart';

class KonsentrasiPage extends StatelessWidget {
  const KonsentrasiPage({super.key});

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
          'Konsentrasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          KonsentrasiCard(
            image: 'assets/images/mobile.png',
            title: 'Mobile Programming',
            description:
            'Konsentrasi Mobile Programming mempelajari pengembangan aplikasi berbasis Android dan iOS dengan fokus pada UI/UX, performa aplikasi, serta integrasi backend.',
          ),
          SizedBox(height: 20),
          KonsentrasiCard(
            image: 'assets/images/web.png',
            title: 'Web Programming',
            description:
            'Konsentrasi Web Programming berfokus pada pembuatan website dinamis dan interaktif menggunakan teknologi frontend dan backend yang sesuai kebutuhan industri.',
          ),
          SizedBox(height: 20),
          KonsentrasiCard(
            image: 'assets/images/multimedia.png',
            title: 'Multimedia',
            description:
            'Konsentrasi Multimedia mempelajari desain grafis, animasi, audio visual, serta multimedia interaktif untuk mendukung industri kreatif.',
          ),
        ],
      ),
    );
  }
}







