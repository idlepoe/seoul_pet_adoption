import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/animal.dart';

part 'api_service.g.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = 'https://asia-northeast3-seoul-pet-adoption.cloudfunctions.net';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<List<Animal>> getAnimals() async {
    try {
      final response = await _dio.get('/getPetList');
      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => Animal.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load animals: ${response.data['message']}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load animals: ${e.message}');
    }
  }

  Future<Animal> getAnimalDetail(int id) async {
    try {
      final response = await _dio.get('/getPetDetail', queryParameters: {'id': id});
      if (response.data['success'] == true) {
        return Animal.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load animal detail: ${response.data['message']}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load animal detail: ${e.message}');
    }
  }
}

@riverpod
ApiService apiService(Ref ref) {
  return ApiService();
}

@riverpod
Future<List<Animal>> animals(Ref ref) {
  return ref.watch(apiServiceProvider).getAnimals();
}

@riverpod
Future<Animal> animalDetail(AnimalDetailRef ref, int id) {
  return ref.watch(apiServiceProvider).getAnimalDetail(id);
} 