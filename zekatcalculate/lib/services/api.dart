import 'package:dio/dio.dart';

class ExchangeRateAPI {
  final String baseUrl = 'https://api.exchangeratesapi.io/latest';
  final Dio dio = Dio();

  ExchangeRateAPI(String apiKey);

  Future<Map<String, dynamic>> getExchangeRates() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Döviz kurları alınamadı. API yanıtı alınamadı.');
      }
    } catch (e) {
      throw Exception('Döviz kurları alınamadı: $e');
    }
  }
}
