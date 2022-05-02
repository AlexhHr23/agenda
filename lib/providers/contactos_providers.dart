class ContactosProvider {
  late List<Map<String, dynamic>> _contactos;

  static final ContactosProvider _instancia = ContactosProvider._privado();

  ContactosProvider._privado() {
    _contactos = [];
  }

  factory ContactosProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get contactos {
    return _contactos;
  }

  void agregarContacto(Map<String, dynamic> nuevoContacto) {
    _contactos.add(nuevoContacto);
  }
}
