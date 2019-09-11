import 'package:flutter/material.dart';

import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  final routes = <String, WidgetBuilder>{
    'HomePage': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
  };

  return routes;
}
