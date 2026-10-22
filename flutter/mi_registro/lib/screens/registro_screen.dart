import 'package:devliveryapp/models/registro.dart';
import 'package:devliveryapp/services/registro_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _servicio = RegistroService();

  final _validarNombre = MultiValidator([
    RequiredValidator(errorText: 'Escribe un nombre'),
    MinLengthValidator(3, errorText: 'Use al menos 3 caracteres')
  ]);

  final _validarCorreo = MultiValidator([
    RequiredValidator(errorText: 'Escribe un correo'),
    EmailValidator(errorText: 'Revisa el formato del correo')
  ]);

  List<Registro> _registros = [];
  bool _cargandoLista = true;
  bool _enviando = false;
  String? _mensajeError;

  @override
  void initState() {
    super.initState();
    _cargarResgistros();
  }

  @override
  void dispose() {
    _correoController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  Future<void> _cargarResgistros() async {
    try {
      final datos = await _servicio.listar();
      if (!mounted) return;
      setState(() => _registros = datos);
    } catch (_) {
      if (!mounted) return;
      setState(() => _mensajeError = 'No se pudo cargar la lista');
    } finally {
      if (mounted) setState(() => _cargandoLista = false);
    }
  }

  Future<void> _guardar() async {
    if (_enviando) return;
    final valido = _formKey.currentState?.validate() ?? false;
    if (!valido) return;

    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _enviando = true;
      _mensajeError = null;
    });

    try {
      final nuevo = await _servicio.crear(
          nombre: _nombreController.text.trim(), // " Juan " => "Juan"
          correo: _correoController.text.trim());

      if (!mounted) return;

      _correoController.clear();
      _nombreController.clear();

      _formKey.currentState?.reset();
      // ["Jorge", "Carlos"]
      setState(() =>
          _registros = [nuevo, ..._registros]); // ["Juan", "Jorge", "Carlos"]
    } on StateError catch (error) {
      setState(() {
        _mensajeError = error.toString().replaceAll('Bad State: ', '');
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _mensajeError = 'Ocurro un error, Intentelo de nuevo');
    } finally {
      if (mounted) setState(() => _enviando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Registro')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Completa los datos para registrar'),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              TextFormField(
                controller: _nombreController,
                validator: _validarNombre,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    labelText: 'Nombre', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _correoController,
                validator: _validarCorreo,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Correo electronico',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: _enviando ? null : _guardar,
                    icon: _enviando
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.send),
                    label: Text(_enviando ? 'Enviando...' : 'Registrar')),
              )
            ]),
          ),
          if (_mensajeError != null) ...[
            const SizedBox(height: 10),
            Text(
              _mensajeError!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            )
          ],
          const Divider(height: 36),
          Text(
            'Registros (${_registros.length})',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (_cargandoLista) const Center(child: CircularProgressIndicator()),
          if (!_cargandoLista && _registros.isEmpty)
            const Text('Todavia no hay registros'),
          if (!_cargandoLista)
            for (final registro in _registros)
              Card(
                child: ListTile(
                    title: Text(registro.nombre),
                    subtitle: Text(registro.correo),
                    trailing: Text('#${registro.id}')),
              )
        ],
      ),
    );
  }
}
