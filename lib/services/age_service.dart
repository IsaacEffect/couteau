import 'dart:convert';
import 'package:http/http.dart' as http;

class AgeService {

  static Future<int?> getAge(String name) async {

    final response = await http.get(
        Uri.parse("https://api.agify.io/?name=$name")
    );

    final data = json.decode(response.body);

    return data["age"];
  }

}