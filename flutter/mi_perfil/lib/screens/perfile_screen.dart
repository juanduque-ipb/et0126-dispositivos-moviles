import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Mi Perfil",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.indigo),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 54,
              backgroundImage: AssetImage('assets/images/perfil_alumno.png'),
            ),
            const Text(
              "Juan Duque",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const Text(
              "Desarrollo de Software",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const Text(
              "Semestre 3",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            const SizedBox(height: 20),
            const IntrinsicHeight(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("12",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w700)),
                    Text("Proyectos", style: TextStyle(fontSize: 20))
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                ),
                Column(
                  children: [
                    Text("4.5",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w700)),
                    Text("Promedio", style: TextStyle(fontSize: 20))
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                ),
                Column(
                  children: [
                    Text("8",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w700)),
                    Text("Cursos", style: TextStyle(fontSize: 20))
                  ],
                )
              ],
            )),
            const SizedBox(height: 42),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => {print("Ver Proyectos")},
                icon: const Icon(Icons.visibility_off_outlined),
                label: const Text("Ver Proyectos"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1, items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Perfil"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: "Ajustes")
      ]),
    );
  }
}
