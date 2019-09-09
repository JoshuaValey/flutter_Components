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
  //imprimir en el Debug Console.
  //print(menuProvider.opciones);
  menuProvider.cargarData().then((opciones) {
    print('_lista');
    print(opciones);
  });

//No meter el metodo de crar listview en el future para evitar
//que la app tarde en retornarla
  return ListView(
    children: _listaItems(),
  );
}

_listaItems() {
  return [
    ListTile(title: Text("Uno")),
    Divider(),
    ListTile(title: Text("Uno")),
    Divider(),
    ListTile(title: Text("Uno")),
    Divider(),
  ];
}
