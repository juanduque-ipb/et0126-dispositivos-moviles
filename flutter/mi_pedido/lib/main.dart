import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Mi pedido',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      // A widget which will be started on application startup
      home: ScreenDelivery(),
    );
  }
}

class ScreenDelivery extends StatefulWidget {
  final String productName;

  const ScreenDelivery({super.key, this.productName = 'Hanburguesa'});

  @override
  State<ScreenDelivery> createState() => _ScreenDelivery();
}

class _ScreenDelivery extends State<ScreenDelivery> {
  int items = 0;
  final int price = 18000;

  String message = 'Todavia no has confirmado pedido';

  void increase() {
    setState(() {
      items++;
    });
  }

  void decrease() {
    if (items > 0) {
      setState(() {
        items--;
      });
    }
  }

  void confirmOrder() {
    if (items == 0) return;

    setState(() {
      final int total = items * price;
      message = 'Pedido confirmado: $items hamburguesa(s). Total: \$ $total';
      items = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = items * price;
    return Scaffold(
      appBar: AppBar(title: const Text("Arma tu pedido")),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                widget.productName,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 20),
              Text(
                'Cantidad $items',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                'Total $total',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: increase, icon: const Icon(Icons.add_circle)),
                  IconButton(
                      onPressed: items > 0 ? decrease : null,
                      icon: const Icon(Icons.remove_circle))
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: items > 0 ? confirmOrder : null,
                  child: const Text('Confirmar pedido')),
              const SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
              )
            ])),
      ),
    );
  }
}
