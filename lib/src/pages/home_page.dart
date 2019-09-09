import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter_components/src/providers/menu_provider.dart';

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
        children: _listaItems(snapShot.data),
      );
    },
  );

  /*return ListView(
    children: _listaItems(),
  );*/
}

List<Widget> _listaItems(List<dynamic> data) {
  final List<Widget> opciones = [];

  data.forEach((opt) {
    final widgetTemp = ListTile(
      //'texto' viene del json
      title: Text(opt['texto']),
      leading: Icon(
        Icons.access_alarm,
        color: Colors.blueAccent,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.blueAccent,
      ),
      onTap: () {},
    );

    opciones..add(widgetTemp)..add(Divider());
  });
  return opciones;
}
