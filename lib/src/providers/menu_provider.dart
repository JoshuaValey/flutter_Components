//Manejo del archivo mune_opts.json

//Show es para solo importar un objeto de services.dart para leer el archivo json
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert'; //Decode the json file.

//Se hace privada a la clase par ser llamada solamente en este archivo...
//Debajo de la misma clase
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    // _cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    //traer un string de una ruta luego(then) mapear el string como json.
    //data es el string que devuelve el Future<String> loadString();
    // 3. Que el metodo cargarData espere a que la respuesta responda(await)
    //antes de mandar el return al constructor.
    final respuesta = await rootBundle.loadString('data/menu_opts.json');
    //mapear el string y decodificarlo.
    Map dataMap = json.decode(respuesta);
    print(dataMap['nombreApp']);
    //agregamos el valor del string de la llave 'rutas' a la lista dinamica.
    opciones = dataMap['rutas'];

    return opciones;
  }
}

//La instancia es publica y la calse es privada, asi solo se puede hacer una instancia
//dentro del archivo del provider y no se puede crear otra fuera.
//La instancia menuProvider es la que sera llamada en otras clases.
final menuProvider = new _MenuProvider();
