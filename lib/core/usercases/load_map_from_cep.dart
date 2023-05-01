import 'package:cep_view/core/api/cep_api.dart';
import 'package:cep_view/core/api/static_map_api.dart';
import 'package:cep_view/core/model/address.dart';

class LoadMapFromCep {
  final CepApi _cepApi;
  final StaticMapApi _staticMapApi;

  LoadMapFromCep({
    required CepApi cepApi, 
    required StaticMapApi staticMapApi
  }) :
    _cepApi = cepApi,
    _staticMapApi = staticMapApi;


  Future<Uri> call(String cep) async {
    final Address adress = await _cepApi.getAddress(cep);
    final Future<Uri> uri = _staticMapApi.getMapImage(adress);

    return uri;
  }
}
