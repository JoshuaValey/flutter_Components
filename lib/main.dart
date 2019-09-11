import 'package:flutter/material.dart';
//import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
//import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/routes/routes.dart';
//import 'package:flutter_components/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Components',
      //home: HomePage(),
      //El string debe ser igual al de la rut en el json
      initialRoute: 'HomePage',
      routes: getApplicationRoutes(),
      //Propiedad que se ejecuta cuando se referencia a una ruta
      //que no ha sido definida.
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
