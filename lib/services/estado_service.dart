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
   Future<EstadoDTO> getEstadoById(int id) async {
    return await network
        .request(HttpMethod.GET, 'api/Estado/$id')
        .then((response) async {
      if (response != null) {
        return EstadoDTO.map(response.data);
      } else {
        return null;
      }
    }).catchError((error) {
      throw (error);
    });
  }
   Future<dynamic> cadastrarEstado(EstadoDTO estado) async {
    return await network
        .request(HttpMethod.POST, 'api/Estado', body: estado)
        .catchError((error) {
      throw (error);
    });
  }
  Future<dynamic> atualizarEstado(EstadoDTO estado) async {
    return await network
        .request(HttpMethod.PUT, 'api/Estado/${estado.estadoId}', body: estado)
        .catchError((error) {
      throw (error);
    });
  }

  Future<dynamic> deleteEstado(int id) async  {
    return await network
      .request(HttpMethod.DELETE, 'api/Estado/$id')
      .catchError((error) {
        throw (error);
      });
  }
}
