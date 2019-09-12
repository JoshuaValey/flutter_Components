import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          Text('Todo esto es un input'),
          SizedBox(height: 5.0),
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //se enfoca cuando la page se lanza.
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: "Nombre de la persona",
        hintStyle: TextStyle(color: Colors.blueGrey),
        labelText: 'Nombre',
        helperText: 'Solo es un nombre',
        suffixIcon: Icon(Icons.input),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valorInput) {
        setState(() {
          _nombre = valorInput;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }
}
