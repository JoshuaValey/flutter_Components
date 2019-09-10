import 'package:flutter/material.dart';

///Map<String, IconsData> cuya llave es el nombre
///del icono que necesitamos y su definicion es el
///tipo de icono.
final Map<String, IconData> _icons = {
  'add_alert' /*     */ : Icons.add_alert,
  'accessibility' /* */ : Icons.accessibility,
  'folder_open' /*   */ : Icons.folder_open,
};

///Voy a leer mi Map _icons, pidiendo como parametro
///el nombre del icono que se solicita.
Icon getIcon(String nombreIcono) =>
    Icon(_icons[nombreIcono], color: Colors.blue);
