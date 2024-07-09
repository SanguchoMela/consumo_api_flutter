import 'package:flutter/material.dart';
import '../models/dog.dart';
import '../services/api_service.dart';

class DogProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final List<Dog> _dogList = [];
  bool _isLoading = false;

  List<Dog> get dogList => _dogList;
  bool get isLoading => _isLoading;

  Future<void> fetchDogImage() async {
    _isLoading = true;
    notifyListeners();

    try {
      Dog dog = await _apiService.fetchDogImage();
      _dogList.add(dog);
    } catch (e) {
      throw Exception('Failed to load Dog');
    }

    _isLoading = false;
    notifyListeners();
  }
}
