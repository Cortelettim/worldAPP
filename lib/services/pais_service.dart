import 'package:flutter/material.dart';
import 'package:worldAPP/library/global.dart';
import 'package:worldAPP/models/PaisDTO.dart';
import 'package:worldAPP/network/network.dart';

class PaisService {
  Future<List<PaisDTO>> getPais() async {
    return await network
        .request(HttpMethod.GET, 'api/Pais')
        .then((response) async {
      if (response != null) {
        var list = response.data as List;
        return list.map((e) => PaisDTO.map(e)).toList() ?? [];
      } else {
        return null;
      }
    }).catchError((error) {
      throw (error);
    });
  }

  Future<PaisDTO> getPaisById(int id) async {
    return await network
        .request(HttpMethod.GET, 'api/Pais/$id')
        .then((response) async {
      if (response != null) {
        return PaisDTO.map(response.data);
      } else {
        return null;
      }
    }).catchError((error) {
      throw (error);
    });
  }
}
