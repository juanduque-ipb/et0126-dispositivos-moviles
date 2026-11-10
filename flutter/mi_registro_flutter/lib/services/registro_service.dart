import 'package:devliveryapp/models/registro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistroService {
  final CollectionReference<Map<String, dynamic>> _registros =
      FirebaseFirestore.instance.collection('registros');

  Future<List<Registro>> listar() async {
    final resultado =
        await _registros.orderBy('creadoEn', descending: true).get();

    return resultado.docs.map(_desdeDocumento).toList();
  }

  Future<Registro> crear(
      {required String nombre, required String correo}) async {
    final normalizado = correo.trim().toLowerCase();

    final duplicado =
        await _registros.where('correo', isEqualTo: normalizado).limit(1).get();

    if (duplicado.docs.isNotEmpty) {
      throw StateError("Ya existe un registro con este correo.");
    }

    final nuevo = Registro(
        id: DateTime.now().microsecondsSinceEpoch,
        nombre: nombre.trim(),
        correo: normalizado,
        creadoEn: DateTime.now());

    await _registros.add(_aMapa(nuevo));
    return nuevo;
  }

  Future<Registro> actualizar(
      {required int id, required String nombre, required String correo}) async {
    final documento = await _buscarPorId(id);
    final resgitroActual = _desdeDocumento(documento);
    final correoNormalizado = correo.trim().toLowerCase();

    final duplicado = await _registros
        .where('correo', isEqualTo: correoNormalizado)
        .limit(2)
        .get();

    if (duplicado.docs.any((doc) => doc.id != documento.id)) {
      throw StateError('Ya existe un registro con este correo.');
    }

    final actualizado = Registro(
        id: id,
        nombre: nombre,
        correo: correo,
        creadoEn: resgitroActual.creadoEn);

    await documento.reference.update(_aMapa(actualizado));

    return actualizado;
  }

  Future<void> eliminar(int id) async {
    final documento = await _buscarPorId(id);
    await documento.reference.delete();
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>> _buscarPorId(
    int id,
  ) async {
    final resultado =
        await _registros.where('id', isEqualTo: id).limit(1).get();

    if (resultado.docs.isEmpty) {
      throw StateError('El registro no existe.');
    }

    return resultado.docs.first;
  }

  Registro _desdeDocumento(
    QueryDocumentSnapshot<Map<String, dynamic>> documento,
  ) {
    final datos = documento.data();

    return Registro(
      id: datos['id'] as int,
      nombre: datos['nombre'] as String,
      correo: datos['correo'] as String,
      creadoEn: (datos['creadoEn'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> _aMapa(Registro registro) {
    return {
      'id': registro.id,
      'nombre': registro.nombre,
      'correo': registro.correo,
      'creadoEn': Timestamp.fromDate(registro.creadoEn),
    };
  }
}
