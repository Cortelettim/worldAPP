import 'package:flutter/material.dart';
import 'package:worldAPP/library/global.dart';
import 'package:worldAPP/models/CidadeDTO.dart';

import 'package:worldAPP/network/network.dart';

class PaisService {
  Future<List<CidadeDTO>> getCidade() async {
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
   Future<CidadeDTO> getCidadeById(int id) async {
    return await network
        .request(HttpMethod.GET, 'api/Cidade/$id')
        .then((response) async {
      if (response != null) {
        return CidadeDTO.map(response.data);
      } else {
        return null;
      }
    }).catchError((error) {
      throw (error);
    });
  }

    Future<dynamic>  cadastrarCidade(CidadeDTO cidade) async {
    return await network
        .request(HttpMethod.POST, 'api/Cidade', body: cidade)
        .catchError((error) {
      throw (error);
    });
  }
  Future<dynamic>  atualizarCidade(CidadeDTO cidade) async {
    return await network
        .request(HttpMethod.PUT, 'api/Cidade/${cidade.cidadeId}', body: cidade)
        .catchError((error) {
      throw (error);
    });
  }

  Future<dynamic>  deleteCidade(int id) async  {
    return await network
      .request(HttpMethod.DELETE, 'api/Cidade/$id')
      .catchError((error) {
        throw (error);
      });
  }
}
