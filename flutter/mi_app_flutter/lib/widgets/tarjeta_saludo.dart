import 'package:flutter/material.dart';

class TarjetaSaludo extends StatelessWidget {
  const TarjetaSaludo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.person),
          const SizedBox(height: 40),
          const Text("Juan Duque"),
          const SizedBox(height: 20),
          const Text('Desarrollo de Software'),
          const SizedBox(height: 30),
          const Text(
            "Semestre 2026",
            style: TextStyle(
                color: Colors.cyanAccent,
                backgroundColor: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                "Esto es un texto a la izquierda!",
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Text(
                "Esto es un texto a la derecha!",
                textAlign: TextAlign.center,
              ))
            ],
          ),
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnqeRbSVv_uU7h6zVR-e9xSbsUqkuvUYyhM4Mn1PhI2w&s=10"),
        ],
      ),
    );
  }
}
