import 'package:cep_view/core/usercases/load_map_from_cep.dart';
import 'package:flutter/material.dart';

class AppVM extends ChangeNotifier {
  final LoadMapFromCep _loadMapFromCep;

  AppVM({required loadMapFromCep}) : _loadMapFromCep = loadMapFromCep;

  String _cep = '';

  void setCep(String cep) {
    _cep = cep;
    notifyListeners();
  }

  AsyncSnapshot<Uri> _asyncImageUrl = AsyncSnapshot.nothing();

  void loadMapFromCep() async {
    try {
      _asyncImageUrl = AsyncSnapshot.waiting();
      notifyListeners();
      final imageUrl = await _loadMapFromCep(_cep);
      _asyncImageUrl = AsyncSnapshot.withData(ConnectionState.done, imageUrl);
      notifyListeners();
    } catch (e) {
      _asyncImageUrl = AsyncSnapshot.withError(ConnectionState.done, e);
      notifyListeners();
    }
  }

  AsyncSnapshot<Uri> get imageUrl => _asyncImageUrl;
}
