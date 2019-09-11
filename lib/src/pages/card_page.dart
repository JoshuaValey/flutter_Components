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
        ],
      ),
    );
  }
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
