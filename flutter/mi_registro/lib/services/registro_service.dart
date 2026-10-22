import 'package:devliveryapp/models/registro.dart';

class RegistroService {
  static final List<Registro> _registros = [];
  static int _siguienteId = 1;

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
}
