import 'package:agenda/providers/contactos_providers.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class FormularioPage extends StatefulWidget {
  FormularioPage({Key? key}) : super(key: key);

  static final nombrePagina = "formulario";

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final idForm = GlobalKey<FormState>();

  Map<String, dynamic> nuevoContacto = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: idForm,
          child: Column(
            children: <Widget>[
              _crearInputNombre(),
              SizedBox(
                height: 40.0,
              ),
              _crearInputEmail(),
              SizedBox(
                height: 40.0,
              ),
              _creaInputTelefono(),
              _crearInputBoton(context)
            ],
          ),
        ),
      ),
    );
  }

  _crearInputNombre() {
    return TextFormField(
      onSaved: (valor) {
        nuevoContacto['nombre'] = valor;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  _crearInputEmail() {
    return TextFormField(
      onSaved: (valor) {
        nuevoContacto['email'] = valor;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  _creaInputTelefono() {
    return TextFormField(
      onSaved: (valor) {
        nuevoContacto['email'] = valor;
      },
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.call),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Telefono",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  _crearInputBoton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            idForm.currentState?.save();

            ContactosProvider().agregarContacto(nuevoContacto);

            Navigator.popAndPushNamed(context, HomePage.nombrePagina);
          },
          child: Text("Crear contacto",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
