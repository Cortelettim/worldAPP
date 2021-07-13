import 'package:worldAPP/models/EstadoDTO.dart';
import 'package:worldAPP/models/PaisDTO.dart';

class PaisDTO {
  int paisId;
  String nomePais;
  List<EstadoDTO> estados;

  PaisDTO.map(Map<String, dynamic> json) {
    this.paisId = json['PaisId'];
    this.nomePais = json['NomePais'];
    var list = json['Estados'] as List ;
    this.estados =  list.map((e) => EstadoDTO.map(e)).toList() ?? '';
  }
}
