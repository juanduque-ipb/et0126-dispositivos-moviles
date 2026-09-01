class Monitor {
  final String marca;
  final int tamano;
  final double resolucion;
  bool _encendido = false;

  Monitor(this.marca, this.tamano, this.resolucion);

  bool estaEncendido() {
    return _encendido;
  }

  void encender() => _encendido = true;
}

class Table extends Monitor {
  final String touch;

  Table(String marca, int tamano, double resolucion)
    : touch = "Tiene touch activado",
      super(marca, tamano, resolucion);

  @override
  void encender() => print("Estoy encendido");
}

void main() {
  Monitor lg = Monitor("LG", 45, 1800.0);
  Table samsung = Table("SAMSUNG", 70, 5000.0);

  print(lg.marca);
  samsung.encender();

  print("Samsung touch status: ${samsung.touch}");
  print("Samsung is on: ${samsung.estaEncendido()}");
  print("LG is on: ${lg.estaEncendido()}");
}
