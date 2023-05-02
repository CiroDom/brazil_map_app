import 'package:cep_view/app/res/mapTheme.dart';
import 'package:cep_view/app/views/app_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mapTheme.theme,
      home: AppView(),
    );
  }
}