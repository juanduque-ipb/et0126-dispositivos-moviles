import 'package:flutter/material.dart';

import 'screens/perfile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Mi Perfil',
      debugShowCheckedModeBanner: false,
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      // A widget which will be started on application startup
      home: const PerfilScreen(),
    );
  }
}
