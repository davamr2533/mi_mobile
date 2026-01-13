import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_mobile/models/survey_kepuasan_model.dart';
import 'dart:io';

class ApiConfig {

  static const String pcIp = '192.168.1.2';

  static String get baseUrl {
    if (Platform.isAndroid) {
      // Emulator Android
      if (_isAndroidEmulator) {
        return 'http://10.0.2.2:8000/api';
      }
      // Android asli
      return 'http://$pcIp:8000/api';
    }

    // iOS / Web / Desktop
    return 'http://localhost:8000/api';
  }

  static bool get _isAndroidEmulator {
    return Platform.environment.containsKey('ANDROID_EMULATOR') ||
        Platform.environment.containsKey('ANDROID_AVD_HOME');
  }
}


class SurveyKepuasanService {
  static final String baseUrl = ApiConfig.baseUrl;

  //Service untuk post survey kepuasan ke database
  static Future<void> kirimSurvey({
    required String nama,
    required String nim,
    required String semester,
    required String q1,
    required String q2,
    required String q3,
    required String q4,
    required String q5,
    required String q6,
    required String q7,
    required String q8,
    required String q9,
    required String q10,
    required String q11,
    required String mkTidakMaksimal,
    required String saran,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/post-survey-kepuasan'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "nama": nama,
        "nim": nim,
        "semester": semester,
        "q1": q1,
        "q2": q2,
        "q3": q3,
        "q4": q4,
        "q5": q5,
        "q6": q6,
        "q7": q7,
        "q8": q8,
        "q9": q9,
        "q10": q10,
        "q11": q11,
        "mk_tidak_maksimal": mkTidakMaksimal,
        "saran": saran,
      }),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Gagal mengirim survey');
    }
  }

  //Service untuk get data kritik dan saran dari database
  static Future<List<SurveyKepuasan>> fetchData() async {
    final url = Uri.parse('$baseUrl/get-survey-kepuasan');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List listData = decoded['data'];

      return listData
          .map((e) => SurveyKepuasan.fromJson(e))
          .toList();
    } else {
      throw Exception(
        'Gagal mengambil data (${response.statusCode})',
      );
    }
  }
}
