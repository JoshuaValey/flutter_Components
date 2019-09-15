import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listaNumeros = [1, 2, 3, 4, 5, 10, 20, 30, 40, 50];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List page'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    //Renderiza los elementos segun sea necesario.
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
        );
      },
      //Cuantos elementos tiene la lista
      itemCount: _listaNumeros.length,
    );
  }
}
//https://picsum.photos/id/935/500/300
