import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DosenCard extends StatelessWidget {
  final String imagePath;
  final String nama;
  final String nidn;

  const DosenCard({
    super.key,
    required this.imagePath,
    required this.nama,
    required this.nidn,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Foto Dosen
          Image.asset(
            imagePath,
            height: 170,
            fit: BoxFit.contain,
          ),


          // Nama (pill ungu)
        SizedBox(
          width: 290, // atur sesuai desain
          height: 44,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF5B2DA3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              nama,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),

          const SizedBox(height: 8),

          // NIDN
          Text(
            nidn,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),


        ],
      )
    );


  }
}
