import 'package:flutter/material.dart';
import 'package:worldAPP/library/global.dart';
import 'package:worldAPP/models/EstadoDTO.dart';

import 'package:worldAPP/network/network.dart';

class EstadoService {
  Future<List<EstadoDTO>> getEstado() async {
    return await network
        .request(HttpMethod.GET, 'api/Estado')
        .then((response) async {
      if (response != null) {
        var list = response.data as List;
        return list.map((e) => EstadoDTO.map(e)).toList() ?? [];
      } else {
        return null;
      }
    }).catchError((error) {
      throw (error);
    });
  }
}
