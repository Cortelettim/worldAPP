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
    this.paisId = json['paisId'];
    this.nomeEstado = json['nomePais'];
    this.estadoId = json['estadoId'];
    this.pais = json['pais'] as PaisDTO;
    var list = json['cidades'] as List;
    if (list != null)
      this.cidades = list.map((e) => CidadeDTO.map(e)).toList() ?? [];
  }
}
