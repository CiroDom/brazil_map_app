import 'package:cep_view/configs/keys.dart';

import '../model/address.dart';

class StaticMapApi {
  Future<Uri> getMapImage(Address address) async {
    return Uri.https(
      '//maps.googleapis.com',
      '/maps/api/staticmap',
      {
          'center': address.formatedAdress,
          'zoom': '10',
          'size': '800x1600',
          'key': gmapsKey,
      }
    );
  }
}
