import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_mobile/card/survey_card.dart';
import 'package:mi_mobile/models/survey_kepuasan_model.dart';
import 'package:mi_mobile/services/survey_kepuasan_service.dart';

class GetSurveyKepuasanPage extends StatefulWidget {
  const GetSurveyKepuasanPage({super.key});

  @override
  State<GetSurveyKepuasanPage> createState() => _GetSurveyKepuasanPageState();
}

class _GetSurveyKepuasanPageState extends State<GetSurveyKepuasanPage> {
  late Future<List<SurveyKepuasan>> futureSurvey;

  @override
  void initState() {
    super.initState();
    futureSurvey = SurveyKepuasanService.fetchData();
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
          'Survey Kepuasan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: FutureBuilder<List<SurveyKepuasan>>(
        future: futureSurvey,
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

              ...data.map((item) => SurveyCard(
                nama: item.nama,
                nim: item.nim,
                semester: item.semester,
                q1: item.q1,
                q2: item.q2,
                q3: item.q3,
                q4: item.q4,
                q5: item.q5,
                q6: item.q6,
                q7: item.q7,
                q8: item.q8,
                q9: item.q9,
                q10: item.q10,
                q11: item.q11,
                mkTidakMaksimal: item.mkTidakMaksimal,
                saran: item.saran,
              )),

            ],
          );

        },
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
