import 'package:cep_view/app/app_widget.dart';
import 'package:cep_view/core/api/cep_api.dart';
import 'package:cep_view/core/api/static_map_api.dart';
import 'package:flutter/material.dart';

import 'core/usercases/load_map_from_cep.dart';

late LoadMapFromCep loadMapFromCep;

void main() async {
  final CepApi cepApi = CepApi();
  final StaticMapApi staticMapApi = StaticMapApi();

  loadMapFromCep = LoadMapFromCep(cepApi: cepApi, staticMapApi: staticMapApi);

  runApp(const AppWidget());
}
