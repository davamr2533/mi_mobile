import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_mobile/models/kritik_saran_model.dart';

class KritikSaranService {
  static const String baseUrl = 'http://192.168.1.2:8000/api';

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
