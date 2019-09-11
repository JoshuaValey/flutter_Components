#Apuntes 

##Archivo menu_opts.json. 

Luego de pegar el archivo json dentro de una nueva carpeta "Data", manejarlo como asset(Recurso estatico) en el pubspec.yaml. 

* crear un directorio de providers
* crear el provider que manejara la data del alchivo json menu. 
* importar el paquete de flutter services. 
* Traer con show solamente el objeto que necesitamos "rootBundle"

Futures. 
* Un future tiene varios estados. 
* Cuando esta piediento la informacion. 
* Cuando se resuelve. 
* Cuando da un error. 

Navegar entre paginas 
* Navegar a una dola pagina.
```dart
final route = MaterialPageRoute(
          builder: (/*BuildContext*/ context) => <PaginaDestino>();
        //Navegacion
        Navigator.push(context, route);
```
* Regresar a la pagina anterior. 
```dart
Navigator.pop(context);
```

* Navegar por rutas string. 

```dart
Navigator.pushNamed(context, 'rutaString');
```

* Navegar con rutas, ir al main y usar la propiedad rutes: luego crear el mapa con las rutas. 
* Remplazar la propiedad "home: " con lo siguiente. 
```dart
//home: HomePage(),
//Ejemplo.
      //El string debe ser igual al de la rut en el json
      initialRoute: 'HomePage',
      routes: <String, WidgetBuilder>{
        'HomePage': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
      },
```
