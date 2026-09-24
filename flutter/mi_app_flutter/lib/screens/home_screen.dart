import 'package:flutter/material.dart';

import '../widgets/tarjeta_saludo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Mi primera app",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: const Center(
        child: TarjetaSaludo(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {print("Hola soy un touch")},
          child: Icon(Icons.add)),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        height: 30,
      ),
    );
  }
}

// snake_case -> archivo y/o variables
// UpperCamelCase -> clases
// camelCase -> funcione Y/O metodos
