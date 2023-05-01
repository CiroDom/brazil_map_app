import 'package:cep_view/main.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  String? _mapUrl;

  void _loadMapImage() async {
    final Uri uri = await loadMapFromCep('40080121');
    setState(() {
      _mapUrl = uri.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMapImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (_mapUrl != null) Image.network(_mapUrl!)
        ],
      ),
    );
  }
}
