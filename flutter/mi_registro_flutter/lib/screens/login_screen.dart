import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _correo = TextEditingController();
  final _clave = TextEditingController();
  bool _cargando = false;
  String? _error;

  @override
  void dispose() {
    _correo.dispose();
    _clave.dispose();
    super.dispose();
  }

  Future<void> _ingresar() async {
    if (_cargando || !(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() {
      _cargando = true;
      _error = null;
    });

    try {
      //await FirebaseAuth.instance.createUserWithEmailAndPassword(
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _correo.text.trim(), password: _clave.text.trim());
    } on FirebaseAuthException {
      if (mounted) {
        setState(() {
          _error = 'No se pudo iniciar sesión. Revisa tus datos.';
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = 'Error de conexión, Intentalo de nuevo';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _cargando = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Iniciar sesión')),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _correo,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'Correo electronico'),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: 'El correo es requerido'),
                          EmailValidator(errorText: 'Escribe un correo')
                        ]).call),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _clave,
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Escribe tu contraseña'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    if (_error != null)
                      Text(
                        _error!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: _cargando ? null : _ingresar,
                        child: Text(_cargando ? 'Enviado...' : 'Entrar'))
                  ],
                ))
          ],
        ));
  }
}
