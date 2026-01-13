import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//class untuk pop up success
class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20)
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFECECEC),
                  borderRadius: BorderRadiusGeometry.circular(100),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusGeometry.circular(100),
                      ),
                    ),

                    Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFF57D85B),
                      size: 75,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Success!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Text(
                "Login berhasil!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0x80000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class untuk pop up success
class LogOutSuccess extends StatelessWidget {
  const LogOutSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20)
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFECECEC),
                  borderRadius: BorderRadiusGeometry.circular(100),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusGeometry.circular(100),
                      ),
                    ),

                    Icon(
                      Icons.check_circle_rounded,
                      color: Color(0xFF57D85B),
                      size: 75,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Success!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Text(
                "Anda berhasil LogOut!",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0x80000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}