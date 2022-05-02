import 'package:agenda/pages/formulario.dart';
import 'package:agenda/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        HomePage.nombrePagina: (BuildContext context) => HomePage(),
        FormularioPage.nombrePagina: (BuildContext context) => FormularioPage(),
      },
    );
  }
}
