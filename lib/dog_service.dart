import 'package:dio/dio.dart';
import 'package:dogs/dog_model.dart';

class DogService {
  DogService(this.dio);
  final Dio dio;

  Future<DogModel> getDog() async {
    const url = 'https://dog.ceo/api/breeds/image/random';
    try {
      final response = await dio.get(url);
      return DogModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erro ao pegar dogs');
    }
  }
}
