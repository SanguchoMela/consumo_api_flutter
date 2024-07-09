import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog.dart';

class ApiService {
  final String baseUrl = "https://dog.ceo/api/breeds/image/random";

  Future<Dog> fetchDogImage() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Dog.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
