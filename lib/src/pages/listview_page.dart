import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //Propiedades -> POSICION ACTUAL EN PIXELES Y MAXIMO DE PIXELES.

      //Si la posicion actual es de n pixeles
      //y el scroll maximo es de esos n pixeles
      //-> Estamos al final de la lista
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _agregar10();
      }
    });
  }

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
      controller: _scrollController,
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

  ///Este metodo agrega 10 img a la lista
  void _agregar10() {
    for (var i = 1; i <= 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});
    }
  }
}
//https://picsum.photos/id/935/500/300
