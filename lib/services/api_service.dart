import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/animal.dart';

part 'api_service.g.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = 'https://api.example.com'; // 실제 API 엔드포인트로 변경 필요
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<List<Animal>> getAnimals() async {
    try {
      final response = await _dio.get('/animals');
      final List<dynamic> data = response.data['DATA'];
      return data.map((json) => Animal.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load animals: ${e.message}');
    }
  }

  Future<Animal> getAnimalDetail(int id) async {
    try {
      final response = await _dio.get('/animals/$id');
      return Animal.fromJson(response.data['DATA']);
    } on DioException catch (e) {
      throw Exception('Failed to load animal detail: ${e.message}');
    }
  }
}

@riverpod
ApiService apiService(ApiServiceRef ref) {
  return ApiService();
}

@riverpod
Future<List<Animal>> animals(AnimalsRef ref) {
  return ref.watch(apiServiceProvider).getAnimals();
}

@riverpod
Future<Animal> animalDetail(AnimalDetailRef ref, int id) {
  return ref.watch(apiServiceProvider).getAnimalDetail(id);
} 