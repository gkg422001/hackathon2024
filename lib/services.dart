import 'package:hackathon/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<Patient>> fetchData() async {
    var person_list = <Patient>[]; // Explicitly declare the type here
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/patients/'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> item in data) {
        person_list.add(Patient.fromJson(item));
      }
      return person_list;
    } else {
      throw Exception('Failed to load friends');
    }
  }
}
