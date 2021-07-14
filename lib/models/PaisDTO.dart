import 'package:worldAPP/models/EstadoDTO.dart';
import 'package:worldAPP/models/PaisDTO.dart';

class PaisDTO {
  int paisId;
  String nomePais;
  List<EstadoDTO> estados;

  PaisDTO.map(Map<String, dynamic> json) {
    this.paisId = json['paisId'];
    this.nomePais = json['nomePais'];
    var list = json['estados'] as List ;
    if(list != null)
    this.estados =  list.map((e) => EstadoDTO.map(e)).toList() ?? [];
  }
}
