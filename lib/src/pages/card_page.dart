import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards")),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
        ],
      ),
    );
  }
}

Widget _cardTipo2() {
  return Card(
    child: Column(
      children: <Widget>[
        //FadeInImage ofrece un placeHolder
        FadeInImage(
          image: NetworkImage(
              "http://hdqwalls.com/wallpapers/anime-cityscape-landscape-scenery-5k-r6.jpg"),
          //placeholder es una imagen que debe estar fisicamente en el dispositivo.
          //para que carge al instante de dibujarse el widget.
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 200.0,
          fit: BoxFit.cover,
        ),
        /*Image(
          image: NetworkImage(
              "http://hdqwalls.com/wallpapers/anime-cityscape-landscape-scenery-5k-r6.jpg"),
        ),*/
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('No tengo idea de que poner'),
        )
      ],
    ),
  );
}

Widget _cardTipo1() {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text('Soy el titulo de esta targeta'),
          subtitle: Text(
              'Esta es la descripcion de la targeta de prueba tarara tarara tarara tarara tarara'),
          onTap: () {},
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(child: Text('Cancelar'), onPressed: () {}),
            FlatButton(child: Text('Ok'), onPressed: () {}),
          ],
        )
      ],
    ),
  );
}
