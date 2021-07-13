import 'package:worldAPP/models/CidadeDTO.dart';
import 'package:worldAPP/models/EstadoDTO.dart';
import 'package:worldAPP/models/PaisDTO.dart';

class EstadoDTO {
  int estadoId;
  String nomeEstado;
  int paisId;
  PaisDTO pais;
  List<CidadeDTO> cidades;

  EstadoDTO.map(Map<String, dynamic> json) {
    this.paisId = json['PaisId'];
    this.nomeEstado = json['NomePais'];
    this.estadoId = json['EstadoId'];
    this.pais = json['Pais'] as PaisDTO;
    var list = json['Cidades'] as List;

    this.cidades = list.map((e) => CidadeDTO.map(e)).toList() ?? '';
  }
}
