import 'dart:convert';
import 'package:http/http.dart' as http;

class GenderService {

  static Future<String?> getGender(String name) async {

    final response = await http.get(
        Uri.parse("https://api.genderize.io/?name=$name")
    );

    final data = json.decode(response.body);

    return data["gender"];
  }

}