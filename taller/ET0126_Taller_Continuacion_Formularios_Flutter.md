# Taller de continuación: formularios y servicio en memoria para tu app

**I.U. Pascual Bravo · ET0126 · Programación de Dispositivos Móviles**  
**Entrega:** domingo 1 de noviembre de 2026  
**Modalidad de desarrollo:** individual; cada estudiante continúa la app que inició en el Taller Flutter 1.  
**Entrega por mensaje:** un mensaje interno por pareja, con los nombres y los enlaces a los dos repositorios.

## Punto de partida

Este taller continúa el [Taller Flutter 1](https://github.com/juanduque-ipb/et0126-dispositivos-moviles/blob/main/taller/ET0126_Taller_Flutter_1.md). No empieces otra app ni cambies el problema que elegiste. Conserva el nombre, el usuario, la necesidad que resuelve y el repositorio de GitHub de tu proyecto.

Ahora vas a agregar un flujo completo para crear y consultar información relevante para esa misma app. El flujo conectará una pantalla con formulario, reglas de validación, un modelo y un servicio asíncrono en memoria que representa el comportamiento de una API.

## Objetivos de aprendizaje

Al completar el taller podrás:

- decidir qué partes de una pantalla necesitan `StatefulWidget` y cuáles pueden ser `StatelessWidget`;
- agrupar campos con `Form` y validar con `GlobalKey<FormState>`;
- usar la biblioteca `form_field_validator` junto con una regla propia del dominio de tu app;
- separar la interfaz, el modelo de datos y las operaciones del servicio;
- representar una operación asíncrona con `Future`, `async`, `await` y una demora simulada;
- mostrar estados de carga, lista vacía, éxito y error sin bloquear la interfaz;
- explicar por qué los registros del servicio en memoria no permanecen al reiniciar la aplicación.

## Reto

Integra en tu app un formulario para registrar un elemento relacionado con su función principal y una vista donde se pueda consultar el elemento creado. Por ejemplo:

| App que ya tienes | Elemento que podrías registrar |
| --- | --- |
| Organizador de tareas | Una tarea con título, prioridad y fecha límite. |
| Control de gastos | Un gasto con descripción, categoría y valor. |
| App de hábitos | Un registro de actividad con fecha y observación. |
| Recetario | Una receta con nombre, categoría e instrucciones breves. |
| Apoyo al estudio | Una sesión de estudio con materia, duración y tema. |

Los ejemplos son orientativos. Define los campos según tu app y explica en el `README.md` por qué ese registro le sirve a su usuario. No entregues un formulario genérico de registro de usuario si no corresponde al problema que ya elegiste.

## Requerimientos funcionales

1. **Continúa la misma app.** El nuevo flujo debe abrirse desde una pantalla o acción de tu aplicación actual. Mantén el problema, el nombre y la identidad visual de la app.
2. **Conserva el avance anterior.** No elimines la función principal, el modelo, los datos persistentes, el Canvas ni otros elementos requeridos en el Taller Flutter 1. Si necesitas aislar los registros temporales de la simulación, crea una función relacionada con el mismo dominio y explica la diferencia.
3. **Construye un formulario útil.** Incluye al menos tres campos que representen datos distintos de tu elemento. Usa el control adecuado: texto, número, selección, fecha u otro que tenga sentido. Cada campo debe tener etiqueta clara y un mensaje de error que ayude a corregirlo.
4. **Valida antes de guardar.** El botón de guardar debe ejecutar `_formKey.currentState!.validate()`. Si algún campo es inválido, los errores aparecen en la interfaz y el servicio no recibe la solicitud.
5. **Integra `form_field_validator`.** Agrega la dependencia desde la terminal:

   ```bash
   flutter pub add form_field_validator
   ```

   Usa al menos dos validadores de la biblioteca. En al menos un campo de texto, combina reglas con `MultiValidator`, por ejemplo `RequiredValidator` y `MinLengthValidator`. Incluye al menos una regla específica del dominio de tu app, como impedir un valor menor o igual a cero, exigir una categoría o validar que una fecha no sea anterior a hoy.
6. **Crea o adapta el modelo.** Representa los datos con una clase Dart tipada. Reutiliza el modelo que ya tengas si corresponde; evita guardar los campos principales en listas paralelas o como un `Map` sin tipos.
7. **Separa el servicio de la pantalla.** Crea o adapta un archivo dentro de `lib/services/`. El servicio debe ofrecer, como mínimo, una operación asíncrona para listar y otra para crear. La pantalla no debe modificar directamente la lista privada del servicio.
8. **Simula el tiempo de respuesta.** Usa `Future`, `async` y `await`, con `Future.delayed` en el servicio. El retardo solo representa una respuesta futura; no es una petición de red real.
9. **Muestra el resultado.** Después de guardar correctamente, el elemento debe quedar visible en la lista y la app debe dar una confirmación. El servicio debe poder rechazar una operación cuando se incumpla una regla de negocio; muestra un mensaje comprensible y no agregues un elemento falso.
10. **Evita envíos repetidos.** Mientras se guarda, desactiva el botón o muestra progreso. Una pulsación rápida no debe crear dos copias del mismo elemento.

## Validación: ejemplo de referencia

Adapta las reglas a los datos de tu app. Este ejemplo valida un título; no reemplaza las reglas que necesites para tus otros campos.

```dart
import 'package:form_field_validator/form_field_validator.dart';

final tituloValidator = MultiValidator([
  RequiredValidator(errorText: 'Escribe un título.'),
  MinLengthValidator(3, errorText: 'Usa al menos 3 caracteres.'),
]);
```

Luego pasa el validador al campo correspondiente:

```dart
TextFormField(
  controller: _tituloController,
  decoration: const InputDecoration(labelText: 'Título'),
  validator: tituloValidator,
)
```

Para un campo numérico puedes convertir el texto con `double.tryParse` y comprobar el rango. Para una lista desplegable o un selector de fecha, valida también que exista una selección válida. No uses una sola regla genérica para todos los campos.

## Organización esperada

Respeta la estructura que ya tiene tu proyecto. Si todavía no separaste estas responsabilidades, puedes usar una estructura como esta:

```text
lib/
  main.dart
  models/
    elemento.dart
  screens/
    inicio_screen.dart
    crear_elemento_screen.dart
  services/
    elemento_service.dart
  widgets/
    elemento_card.dart
```

- **`models/`** describe los datos y sus tipos.
- **`services/`** lista y crea datos; simula la demora y puede rechazar una regla de negocio.
- **`screens/`** coordina el formulario, las acciones y los estados visibles.
- **`widgets/`** contiene piezas reutilizables que reciben datos y callbacks.

No tienes que renombrar tus archivos si ya están organizados. Sí debes poder señalar dónde está cada responsabilidad.

## Servicio en memoria: contrato esperado

La forma exacta depende del modelo de tu app. Este esquema supone que el modelo tiene un campo `codigo` que es único; cámbialo por una clave o regla que tenga sentido en tu dominio. Muestra el comportamiento esperado, no una solución para copiar sin adaptar:

```dart
class ElementoService {
  static final List<Elemento> _elementos = [];

  Future<List<Elemento>> listar() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List<Elemento>.unmodifiable(_elementos);
  }

  Future<Elemento> crear(Elemento elemento) async {
    await Future.delayed(const Duration(milliseconds: 700));
    final existe = _elementos.any(
      (actual) => actual.codigo == elemento.codigo,
    );
    if (existe) {
      throw StateError('Ya existe un elemento con ese código.');
    }
    _elementos.insert(0, elemento);
    return elemento;
  }
}
```

El servicio debe ser la única capa que conozca cómo se listan y crean estos registros. Define al menos una regla de negocio que permita probar un rechazo: por ejemplo, un código único, un límite de elementos o una combinación que no se pueda repetir. Si tu app permite repetir todos sus datos, acuerda y documenta una regla de duplicado específica para esta simulación. El servicio debe devolver un error controlado cuando se incumpla.

**Límite de la simulación:** la lista vive en la memoria del proceso. Los elementos creados por este servicio pueden desaparecer al cerrar o reiniciar la app. Esto es esperado y no equivale a guardar con `SharedPreferences`, SQLite o una API real. Conserva la persistencia que ya habías implementado; documenta qué datos pertenecen a la función anterior y cuáles son temporales para esta simulación.

## Estado y ciclo de vida

Usa `StatefulWidget` para la pantalla que administra el formulario y el resultado. Mantén allí, por ejemplo, la `GlobalKey<FormState>`, los `TextEditingController`, la lista visible y las banderas de carga. Declara la llave en el `State` y no la crees dentro de `build()`. Consulta los datos con `listar()` al entrar a la pantalla, por ejemplo en `initState()`; no llames al servicio desde `build()`.

Maneja el guardado con `try`, `catch` y `finally` para cubrir éxito, error y fin de carga. Después de una operación `await`, verifica que el `State` siga montado antes de llamar a `setState` o usar el `context`. Libera los controladores en `dispose()`. Deja como `StatelessWidget` las tarjetas, mensajes o componentes visuales que solo reciben datos y callbacks.

El recorrido de guardar debe seguir este orden:

1. Ejecutar la validación del formulario.
2. Si hay errores, detenerse sin llamar al servicio.
3. Marcar la pantalla como ocupada y evitar otro envío.
4. Esperar el resultado de `crear()`.
5. Si la operación funciona, actualizar la lista, mostrar confirmación y limpiar el formulario.
6. Si falla, conservar los datos escritos y mostrar el error.
7. En cualquier caso, terminar el estado de carga cuando el `State` siga montado.

## Estados que debe poder ver quien usa tu app

| Estado | Comportamiento esperado |
| --- | --- |
| Cargando lista | Indicador visible mientras `listar()` espera su respuesta. |
| Lista vacía | Mensaje útil y acción para crear el primer elemento. |
| Formulario inválido | Errores junto a los campos; no se llama a `crear()`. |
| Guardando | Indicador o botón deshabilitado; no se aceptan envíos repetidos. |
| Guardado correcto | Confirmación y elemento visible en la lista. |
| Error del servicio | Mensaje entendible; no se agrega el elemento y no se pierde lo escrito. |

## Comprobación manual obligatoria

Prueba estos casos en el emulador o dispositivo y anota el resultado en el `README.md`:

| Caso | Acción | Resultado que debes comprobar |
| --- | --- | --- |
| Campos vacíos | Pulsa guardar sin escribir. | Aparecen los errores y no se agrega un registro. |
| Texto muy corto | Escribe menos caracteres que el mínimo definido. | El validador muestra el mensaje correspondiente. |
| Regla de dominio | Ingresa un número, fecha o selección no permitida. | La app explica qué debe corregirse. |
| Registro válido | Completa los datos y guarda. | Se ve el progreso, la confirmación y el registro. |
| Error de negocio | Repite el dato o la combinación que tu servicio definió como no repetible. | No hay duplicado y se informa el error. |
| Envío rápido | Pulsa guardar varias veces durante la demora. | Solo se crea un elemento. |
| Reinicio | Cierra y abre la app. | La persistencia anterior sigue funcionando; los datos de la simulación pueden reiniciarse. |

## Entrega

Antes del domingo 1 de noviembre de 2026, cada estudiante debe subir a **su mismo repositorio de GitHub**:

- el código Flutter de la app iniciada en el Taller Flutter 1;
- el formulario integrado con la validación y el servicio asíncrono en memoria;
- la lista o vista que permite comprobar el registro creado;
- un `README.md` actualizado con el propósito del flujo, campos y validaciones, explicación del modelo y el servicio, límite de los datos en memoria, resultados de las pruebas manuales y declaración de uso de IA;
- capturas de la app en los estados de formulario, validación y resultado;
- commits con mensajes claros que permitan reconocer el avance.

No es necesario crear una API real ni publicar un APK para este taller.

### Mensaje interno por pareja

Para reducir mensajes repetidos, envíen **un solo mensaje interno por pareja**. Cada estudiante conserva y entrega su propio repositorio. Una persona envía un mensaje por el canal de Google Chat del curso, con los nombres de ambos y los dos enlaces:

```text
ET0126 - Taller de continuación
Integrantes: [Nombre 1] y [Nombre 2]
App / repositorio 1: [enlace]
App / repositorio 2: [enlace]
```

## Criterios de evaluación

| Criterio | Valor |
| --- | ---: |
| Continúa la misma app y mantiene accesible el avance anterior. | 15 % |
| Formulario claro con al menos tres campos adecuados al problema. | 15 % |
| Reglas correctas con `form_field_validator` y una validación del dominio. | 20 % |
| Modelo y servicio separados; uso correcto de `Future` y colección en memoria. | 20 % |
| Estados visuales, errores, protección contra doble envío y ciclo de vida. | 20 % |
| README, capturas, commits y declaración de uso de IA. | 10 % |
| **Total** | **100 %** |

## Recursos de consulta

- [Taller Flutter 1 del curso](https://github.com/juanduque-ipb/et0126-dispositivos-moviles/blob/main/taller/ET0126_Taller_Flutter_1.md)
- [Guía oficial de Flutter: formularios y validación](https://docs.flutter.dev/cookbook/forms/validation)
- [API de `Form` y `FormState` en Flutter](https://api.flutter.dev/flutter/widgets/Form-class.html)
- [Paquete `form_field_validator` en pub.dev](https://pub.dev/packages/form_field_validator)
- [Referencia de la API de `form_field_validator`](https://pub.dev/documentation/form_field_validator/latest/)

## Antes de enviar

- [ ] Es la misma app y el mismo repositorio del Taller Flutter 1.
- [ ] El formulario registra información útil para el usuario de mi app.
- [ ] Los mensajes de validación ayudan a corregir los datos.
- [ ] Los datos inválidos no llegan al servicio.
- [ ] Puedo explicar cómo el servicio simula una API y por qué la lista es temporal.
- [ ] La función anterior y la persistencia previamente implementada siguen disponibles.
- [ ] Probé los casos de la tabla y actualicé el `README.md`.
- [ ] Puedo explicar el código que entrego, incluido el que escribí con ayuda de IA.
- [ ] El mensaje único por pareja contiene ambos nombres y los dos enlaces.

### Extensión opcional

Si terminas lo obligatorio, agrega una operación adicional al servicio, como editar o eliminar un elemento, y refleja el cambio en la interfaz sin recargar toda la app. Documenta cómo se conserva la consistencia de la lista y agrega un caso manual para esa operación.

---

*ET0126 · Programación de Dispositivos Móviles · I.U. Pascual Bravo · Semestre agosto-noviembre de 2026*
