import 'package:devliveryapp/screens/registro_screen.dart';
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
      title: 'Registros',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      // A widget which will be started on application startup
      home: const RegistroScreen(),
    );
  }
}
