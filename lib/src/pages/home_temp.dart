import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(
        children: _crearItemsCorto(),
      ),
    );
  }

  List<Widget> _crearItems() {
    //Es una lista dinamica, no se define el largo
    List<Widget> lista = new List<Widget>();

    //Recorremos la lista global "opciones"
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {
      return Column(children: <Widget>[
        ListTile(
          title: Text(item),
          subtitle: Text("Algo"),
          leading: Icon(Icons.accessibility_new),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        Divider()
      ]);
    }).toList();
  }
}
