import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        _fetchData();
      }
    });
  }

  ///Cada que se ingresa a la pagina el scrollcontroller crea un nuevo listener
  ///Debemos destruirlo para evitar fugas de memoria
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List page'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    //Debe envolver a un elemento Scrollable.
    return RefreshIndicator(
      onRefresh: _obtenerPage1,
      //Renderiza los elementos segun sea necesario.
      child: ListView.builder(
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
      ),
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

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {
      final Duration duration = new Duration(seconds: 2);
      //function con () ejecuta en ese punto del codigo;
      //function sin () referencia al metodo;
      return new Timer(duration, _respuestaHTTP);
    });
  }

  void _respuestaHTTP() {
    _isLoading = false;
    //Cuando se tiene la respuesta Http se puede mover el scroll
    //porque ya se sabe que hay mas registros.
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    setState(() {});
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 25.0)
        ],
      );
    } else
      return Container();
  }

  Future<Null> _obtenerPage1() async {
    //Simular Http Request -> Await.
    final duration = new Duration(seconds: 3);

    new Timer(duration, () {
      //purgar la lista de numeros.
      _listaNumeros.clear();
      //quiero las siguientes imagenes.
      _ultimoItem++; //No se resetea a 0 para que salgan imagenes nuevas.
      //cargar 10 registros nuevos. 
      _agregar10();
    });
    return Future.delayed(duration);
  }
}
//https://picsum.photos/id/935/500/300
