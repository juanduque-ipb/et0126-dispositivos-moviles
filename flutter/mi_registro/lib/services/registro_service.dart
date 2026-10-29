import 'package:devliveryapp/models/registro.dart';

class RegistroService {
  static final List<Registro> _registros = [
    Registro(
        id: 1,
        nombre: 'Juan',
        correo: 'juan@correo.com',
        creadoEn: DateTime.now())
  ];
  static int _siguienteId = 2;

  Future<List<Registro>> listar() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List<Registro>.unmodifiable(_registros);
  }

  Future<Registro> crear(
      {required String nombre, required String correo}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final normalizado = correo.trim().toLowerCase();
    final duplicado = _registros.any(
      (registro) => registro.correo == normalizado,
    );

    if (duplicado) {
      throw StateError("Ya existe un registro con este correo.");
    }

    final nuevo = Registro(
        id: _siguienteId++,
        nombre: nombre.trim(),
        correo: normalizado,
        creadoEn: DateTime.now());

    _registros.insert(0, nuevo);
    return nuevo;
  }

  Future<Registro> actualizar(
      {required int id, required String nombre, required String correo}) async {
    final indice = _registros.indexWhere((registro) =>
        registro.id == id); // No retorna 0, porque indice 0 existe

    if (indice == -1) {
      throw StateError('El registro no existe.');
    }

    Registro elemento = _registros[indice];

    final actualizado = Registro(
        id: id, nombre: nombre, correo: correo, creadoEn: elemento.creadoEn);

    _registros[indice] = actualizado;

    return actualizado;
  }

  Future<void> eliminar(int id) async {
    final indice = _registros.indexWhere((registro) => registro.id == id);
    if (indice == -1) {
      throw StateError('El registro no existe.');
    }

    _registros.removeAt(indice);
  }
}
