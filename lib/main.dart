import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:worldAPP/models/PaisDTO.dart';
import 'package:worldAPP/network/network.dart';
import 'package:worldAPP/services/pais_service.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listaLocal = new List<PaisDTO>();
  @override
  void initState() {
    this._registerStores();
    // TODO: implement initState
    this.get().then((map) => {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5,
                ),
              );
            default:
             
                return ListView.builder(itemBuilder: (context, index){
                   if (index <listaLocal.length)
                    return Text('${listaLocal[index].nomePais}', style: TextStyle(color: Colors.white));
                }, itemCount: listaLocal.length,);
          }
        },
      ),
    );
  }
  _registerStores() {
    GetIt getIt = GetIt.I;
    getIt.registerSingleton(NetworkService());
  
  }
  Future<List<PaisDTO>> get() async {
    final _paisService = PaisService();
    await _paisService.getPais().then((response) {
      if (response != null) {
        var listaCloud = response.toList();
        for (var pais in listaCloud) {
          if (listaLocal
                  .where((element) => element.paisId == pais.paisId)
                  .length ==
              0) {
            listaLocal.add(pais);
          }
        }
        return listaLocal;
      } else {
        return null;
      }
    });
    return null;
  }
}
