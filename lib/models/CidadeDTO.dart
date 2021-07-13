import 'package:worldAPP/models/EstadoDTO.dart';

class CidadeDTO {
  int cidadeId;
  String nomeCidade;
  EstadoDTO estado;
  int estadoId;

  CidadeDTO.map(Map<String, dynamic> json) {
    this.cidadeId = json['PaisId'];
    this.nomeCidade = json['NomePais'];
    this.estadoId = json['EstadoId'];
    this.estado = json['Estado'] as EstadoDTO;
  }
}
