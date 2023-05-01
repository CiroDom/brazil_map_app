import 'package:cep_view/core/model/address.dart';
import 'package:dio/dio.dart';

class CepApi {
  final Dio _dio = Dio();

  Future<Address> getAddress(String cep) async {
    final response = await _dio.get('https://brasilapi.com.br/api/cep/v1/$cep');

    return Address.fromMap(response.data);
  }
}
