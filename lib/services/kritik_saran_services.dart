import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_mobile/models/kritik_saran_model.dart';
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

class KritikSaranService {
  static final String baseUrl = ApiConfig.baseUrl;

  //Service untuk post kritik dan saran ke database
  static Future<bool> kirimKritik({
    required String nama,
    required String nim,
    required String email,
    required String kritikSaran,
  }) async {
    final url = Uri.parse('$baseUrl/post-kritik-dan-saran');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'nama': nama,
        'nim': nim,
        'email': email,
        'kritik_saran': kritikSaran,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Gagal mengirim data (${response.statusCode})');
    }
  }

  //Service untuk get data kritik dan saran dari database
  static Future<List<KritikSaran>> fetchData() async {
    final url = Uri.parse('$baseUrl/get-kritik-dan-saran');

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
          .map((e) => KritikSaran.fromJson(e))
          .toList();
    } else {
      throw Exception(
        'Gagal mengambil data (${response.statusCode})',
      );
    }
  }
}
