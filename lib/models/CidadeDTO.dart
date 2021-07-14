import 'package:worldAPP/models/EstadoDTO.dart';

class CidadeDTO {
  int cidadeId;
  String nomeCidade;
  EstadoDTO estado;
  int estadoId;

  CidadeDTO.map(Map<String, dynamic> json) {
    this.cidadeId = json['CidadeId'];
    this.nomeCidade = json['NomeCidade'];
    this.estadoId = json['EstadoId'];
    this.estado = json['Estado'] as EstadoDTO;
  }
}
