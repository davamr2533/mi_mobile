import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_mobile/models/kritik_saran_model.dart';
import 'package:mi_mobile/services/kritik_saran_services.dart';

class GetKritikSaranPage extends StatefulWidget {
  const GetKritikSaranPage({super.key});

  @override
  State<GetKritikSaranPage> createState() => _GetKritikSaranPageState();
}

class _GetKritikSaranPageState extends State<GetKritikSaranPage> {
  late Future<List<KritikSaran>> futureKritik;

  @override
  void initState() {
    super.initState();
    futureKritik = KritikSaranService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0FF),
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

      body: FutureBuilder<List<KritikSaran>>(
        future: futureKritik,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Terjadi error: ${snapshot.error}'),
            );
          }

          final data = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16),
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

              const SizedBox(height: 20),
              
              Text(
                'Daftar Kritik dan Saran: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 12),

              // ===== LIST DATA =====
              ...data.map((item) => kritikCard(
                nama: item.nama,
                isi: item.kritikSaran,
                nim: item.nim,
                email: item.email
              )),
            ],
          );

        },
      ),


      bottomNavigationBar: _footer(),

    );
  }

  Widget kritikCard({required String nama, required String nim, required String email, required String isi}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD24C),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Row(
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),

                Spacer(),

                Text(
                  nim,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ],
            )
          ),

          Divider(color: Colors.black54),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isi,
                  style: const TextStyle(fontSize: 14),
                ),

                SizedBox(height: 22),
                
                Text(email, textAlign: TextAlign.start,)
              ]
              
              
              
            )
            
            
          ),
        ],
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
