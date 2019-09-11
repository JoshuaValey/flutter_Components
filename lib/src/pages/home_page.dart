import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'dart:core';

import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }
}

///Metodo Widget _lista() que retorna un ListView dentro de un futureBuilder.
Widget _lista() {
  //FutureBuilder.
  return FutureBuilder(
//El future: debe estar enlazada a lo que estamos esperando. Osea el Future (cargarData)
    future: menuProvider.cargarData(),
//La informacion que tendra por defecto mientras no se resuelve el future.
    initialData: [],
    //
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapShot) {
      //El Widget se dibuja con la data que viene del Future.
      return ListView(
        //mandamos la data del future a la lista de intems
        children: _listaItems(snapShot.data, context),
      );
    },
  );
}

///Metodo List<Widget> _listaItems.
///Parametros: List<dynamic> data.
///Retorno: List<Widget> opciones.
List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
  final List<Widget> opciones = [];

  data.forEach((opt) {
    final widgetTemp = ListTile(
      //'texto' viene del json
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.blueAccent,
      ),
      onTap: () {
        //La ruta pasa como string, el cual lo tenemos en el
        //Json que esta referenciado por el opt.
        Navigator.pushNamed(context, opt['ruta']);
      },
    );

    opciones..add(widgetTemp)..add(Divider());
  });
  return opciones;
}
