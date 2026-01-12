import 'dart:convert';
import 'package:http/http.dart' as http;

class KritikService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<bool> kirimKritik({
    required String nama,
    required String nim,
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
        'kritik_saran': kritikSaran,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Gagal mengirim data (${response.statusCode})');
    }
  }
}
