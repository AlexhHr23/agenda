import 'package:agenda/pages/home_page.dart';
import 'package:agenda/providers/contactos_providers.dart';
import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({Key? key}) : super(key: key);

  static final nombrePagina = "detalle";

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? contacto =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle contacto'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 20.0,
                bottom: 25.0,
              ),
              child: Text(
                "${contacto!['nombre']}",
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Container(
            child: Text(
              "Correo:",
              style: TextStyle(fontSize: 25.0),
            ),
            margin: EdgeInsets.only(top: 15.0, bottom: 25.0),
          ),
          Container(
            child: Text("${contacto!['email']}"),
          ),
          Container(
            child: Text(
              "Telefono:",
              style: TextStyle(fontSize: 25.0),
            ),
            margin: EdgeInsets.only(top: 30.0, bottom: 25.0),
          ),
          Container(
            child: Text("${contacto!['telefono']}"),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 25.0),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              onPressed: () {
                ContactosProvider().eliminarContacto(contacto);
                Navigator.popAndPushNamed(context, HomePage.nombrePagina);
              },
              child: Text('Eliminar'),
            ),
          )
        ],
      ),
    );
  }
}
