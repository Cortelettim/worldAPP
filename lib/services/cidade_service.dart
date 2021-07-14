import 'package:flutter/material.dart';
import 'package:worldAPP/library/global.dart';
import 'package:worldAPP/models/CidadeDTO.dart';

import 'package:worldAPP/network/network.dart';

class PaisService {
  Future<List<CidadeDTO>> getPais() async {
    return await network
        .request(HttpMethod.GET, 'api/Cidade')
        .then((response) async {
      if (response != null) {
        var list = response.data as List;
        return list.map((e) => CidadeDTO.map(e)).toList() ?? [];
      } else {
        return null;
      }
    }).catchError((error) {
      throw (error);
    });
  }
}
