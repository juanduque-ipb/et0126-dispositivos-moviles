class Registro {
  const Registro({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.creadoEn,
  });

  final int id;
  final String nombre;
  final String correo;
  final DateTime creadoEn;
}
