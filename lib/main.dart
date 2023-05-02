import 'dart:js';

import 'package:cep_view/app/app_view_model.dart';
import 'package:cep_view/app/app_widget.dart';
import 'package:cep_view/core/api/cep_api.dart';
import 'package:cep_view/core/api/static_map_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/usercases/load_map_from_cep.dart';

void main() async {

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => CepApi(),),
        Provider(create: (context) => StaticMapApi(),),
        Provider(create: (context) => LoadMapFromCep(
          cepApi: context.read(),
          staticMapApi: context.read(),
        ),),
        ChangeNotifierProvider(create: (context) => AppVM(loadMapFromCep: context.read()),),
      ],
      child: const AppWidget(),
    ),
  );
}
