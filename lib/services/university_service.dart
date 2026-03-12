import 'dart:convert';
import 'package:http/http.dart' as http;

class UniversityService {

  static Future<List> getUniversities(String country) async {

    final response = await http.get(
        Uri.parse("https://adamix.net/proxy.php?country=$country")
    );

    return json.decode(response.body);

  }

}