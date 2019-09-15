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

* Cuando se llama a una ruta no definida en el "routes: " se llama a la propiedad "onGenerataRoute: "

## Internaciolizacion de app. 
* Agregar la dependencia en el pubspec.yaml. 
```YAML
dependencies:
  flutter:
    sdk: flutter
    #here!
  flutter_localizations:
    sdk: flutter
```

[GlobalMaterialLocalizations](https://docs.flutter.io/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html)

[internationalization](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#specifying-supportedlocales)

* En el main (donde el MaterialApp) importar
```dart
import 'package:flutter_localizations/flutter_localizations.dart';
```
* Y pegar 
```dart
import 'package:flutter_localizations/flutter_localizations.dart';
```
* Colocar los delegados de localizacion en el main. 
```dart
localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
 ],
```
* Colocar las variables soportadas en el main. 
```dart
 supportedLocales: [
    const Locale('en'), // English
    const Locale('he'), // Hebrew
    const Locale('zh'), // Chinese
    // ... other locales the app supports
  ],
  ```

  * Servicio de fotos lorem Picsum. 

  [https://picsum.photos/](https://picsum.photos/)