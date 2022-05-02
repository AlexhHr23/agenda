import 'package:agenda/pages/detalle.dart';
import 'package:agenda/pages/formulario.dart';
import 'package:agenda/providers/contactos_providers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static final nombrePagina = "home";

  static final List<Map<String, dynamic>> contactos = [
    {
      'nombre': "Alex",
      'correo': "alex.hernandez@gmail.com",
      'numero': "2761168026"
    },
    {
      'nombre': "Carlos",
      'correo': "carlosCer@gmail.com",
      'numero': "2761159999"
    }
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda de contactos'),
      ),
      body: (ContactosProvider().contactos.isNotEmpty)
          ? ListView(
              children: _crearContacto(context),
            )
          : Center(
              child: Text("No hay contactos agredados"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.popAndPushNamed(context, FormularioPage.nombrePagina),
        child: Icon(Icons.add_call),
      ),
    );
  }

  List<Widget> _crearContacto(BuildContext context) {
    List<Widget> temporal = [];

    for (Map<String, dynamic> contacto in ContactosProvider().contactos) {
      Widget nuevo = ListTile(
        onTap: () => Navigator.pushNamed(context, DetallePage.nombrePagina,
            arguments: contacto),
        title: Text("${contacto['nombre']}"),
        trailing: Icon(
          Icons.account_circle,
          color: Colors.blue,
        ),
      );
      temporal.add(nuevo);
    }

    return temporal;
  }
}
