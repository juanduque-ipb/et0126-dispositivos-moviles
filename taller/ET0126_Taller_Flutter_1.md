# Taller integrador: inicia tu app de proyecto de clase

**I.U. Pascual Bravo · ET0126 · Programación de Dispositivos Móviles**  
**Entrega:** domingo 11 de octubre de 2026  
**Modalidad:** individual  
**Herramientas:** Flutter, Dart, emulador o dispositivo Android y GitHub

## Propósito

Vas a iniciar la aplicación que quieres desarrollar como proyecto de clase. La primera versión debe resolver una necesidad concreta, funcionar en un dispositivo y mostrar que sabes aplicar lo estudiado hasta ahora: fundamentos de Dart, widgets y composición de pantallas en Flutter, estado e interacción, Canvas, almacenamiento local y control de versiones con GitHub.

La meta es entregar un primer recorrido funcional y explicar con claridad para quién es la app, qué problema atiende y cómo lo resolverá. No se espera que el proyecto esté terminado.

## Reto

Elige una situación real que conozcas y construye una primera versión de una app móvil que ayude a una persona con esa situación. Puede ser para la vida universitaria, el barrio, un trabajo, un pasatiempo o una necesidad propia.

Ejemplos de ideas: organizar tareas de estudio, registrar gastos, llevar control de hábitos, consultar rutas del campus o guardar recetas. Puedes proponer otra idea. Debes poder explicar por qué sería útil para su usuario.

## Parte 1 · Define y explica la app

Antes de programar, escribe esta propuesta en el `README.md` de tu repositorio:

1. **Nombre de la app.**
2. **Usuario:** ¿para quién la estás creando?
3. **Problema:** ¿qué necesidad concreta tiene ese usuario?
4. **Solución:** ¿cómo le ayudará tu app?
5. **Funciones iniciales:** escribe tres acciones que el usuario podrá realizar.
6. **Recorrido principal:** describe en tres a cinco pasos qué hará una persona al abrir la app.
7. **Datos:** ¿qué información necesita guardar la app?
8. **Canvas:** ¿qué elemento visual o gesto de dibujo puede aportar a la solución?

Usa esta frase para empezar la explicación y complétala con tus propias palabras:

> Mi app se llama **[nombre]**. Está dirigida a **[usuario]**, quien necesita **[problema]**. La app le ayudará a **[solución]** mediante **[funciones principales]**.

La explicación debe ser comprensible para alguien que no haya visto tu código.

## Parte 2 · Construye un primer recorrido funcional

Parte de tu proyecto Flutter del curso. Si todavía no tienes un repositorio para esta app, crea uno personal en GitHub con el nombre `et0126-[nombre-de-tu-app]`.

Organiza el código por responsabilidades. Como mínimo, usa esta estructura:

```text
lib/
  main.dart
  screens/
    home_screen.dart
  widgets/
  models/
  services/
assets/
  images/
README.md
```

En esta versión implementa una función central de tu idea. Por ejemplo, registrar y consultar una tarea, agregar y ver un gasto, o crear y consultar una nota. El recorrido debe incluir:

- Una pantalla inicial con el nombre de la app, una descripción breve y una acción principal, construida con `MaterialApp`, `Scaffold` y `AppBar`.
- Organiza el contenido con widgets vistos en clase, como `Padding`, `Row`, `Column`, `Card` o `Container` y `SizedBox`; usa `Text`, `Icon` y botones para comunicar las acciones.
- Separa contenido fijo en widgets sin estado y usa `StatefulWidget` para la pantalla o el componente cuyo estado cambia.
- Una forma sencilla de ingresar o modificar información, con validación antes de aceptarla.
- Una lista o vista de los registros relevantes para el proyecto.
- Una respuesta visual cuando no haya registros y cuando el usuario complete la acción.
- Al menos un control interactivo. El cambio de la interfaz debe manejarse con `StatefulWidget` y `setState` cuando corresponda.
- Un elemento visual creado con Canvas y conectado con la idea de la app. Puede ser, por ejemplo, un trazo para una nota, un mapa sencillo, una firma o una visualización del avance.
- Datos que sigan disponibles después de cerrar y volver a abrir la app. Elige `SharedPreferences` para preferencias o datos simples, o SQLite para una colección de registros. Explica tu elección en el `README.md`.
- Al menos una imagen local en `assets/images/` si aporta al contenido de la app; regístrala en `pubspec.yaml`.

El Canvas debe formar parte de una función que puedas mostrar y explicar. Si tu app no necesita dibujo libre, representa con él información útil para la idea, como un avance, una distribución o un mapa.

## Parte 3 · Aplica Dart y explica tus decisiones

Usa una clase de modelo que represente un dato central de tu app. La clase debe tener atributos, un constructor y al menos un método que tenga sentido para ese dato. En el código del proyecto demuestra estos conceptos:

| Concepto | Evidencia esperada |
|---|---|
| Tipos, `final` o `const` y null safety | El modelo usa tipos claros y marca como nullable solo los datos que realmente pueden faltar. |
| Clases y objetos | Creas objetos del modelo para representar los datos de la app. |
| Funciones | Separas al menos una operación o validación en una función que puedas explicar. |
| `List` | Guardas o recorres los registros principales de la app. |
| `Set` | Representas una colección en la que los repetidos no tienen sentido, como etiquetas únicas. |
| `Map` | Representas datos asociados por llave, como un resumen por categoría o estado. |
| `if` y `for` | Tomas al menos una decisión y recorres datos para mostrarlos o resumirlos. |
| `while` | Úsalo solo para una repetición finita que encaje con la lógica de tu app. No lo uses para esperar toques ni para bloquear la interfaz. Si no hay un caso apropiado, explica en el README por qué no hace falta en este primer recorrido. |

Puedes añadir un apartado **Conceptos de Dart en mi app** al `README.md` con el archivo o la parte del código donde se ve cada concepto. Si decidiste no usar `while`, incluye allí tu explicación.

## Parte 4 · Guarda y publica tu avance

1. Ejecuta la app en un emulador o dispositivo y corrige los errores que impidan completar el recorrido principal.
2. Cierra y vuelve a abrir la app para comprobar que los datos elegidos sí persisten.
3. Agrega al `README.md` una captura de la app y una sección breve de instalación o ejecución.
4. Registra el trabajo con commits pequeños y mensajes claros; evita subir todo en un único commit.
5. Sube el código y el `README.md` a tu repositorio personal de GitHub. Si el repositorio es privado, asegúrate de dar acceso al docente.
6. Comparte el enlace del repositorio o del commit por el canal de Google Chat del curso antes de la fecha de entrega.

En el `README.md`, declara si utilizaste una herramienta de IA y qué parte te ayudó a resolver. Debes poder explicar y modificar en vivo cualquier código que entregues; la autoría y las decisiones siguen siendo tuyas.

## Entrega

Tu repositorio debe incluir:

- La propuesta de app completa en el `README.md`, incluida la explicación de qué hará y para quién.
- El código Flutter organizado en carpetas.
- Una función central que se pueda probar en el emulador o dispositivo.
- La clase modelo y los conceptos de Dart solicitados, o la justificación indicada para `while`.
- Un Canvas conectado con la idea.
- Almacenamiento local comprobado al cerrar y abrir la app.
- Una captura de pantalla y el enlace al repositorio.
- Commits que permitan reconocer cómo avanzaste.

Prepara una explicación oral de dos minutos: presenta el problema, el usuario, la solución, muestra el recorrido y cuenta qué decisión técnica te costó más tomar.

## Lista de revisión

Antes de entregar, verifica:

- [ ] Puedo explicar en una frase de qué será mi app y quién la usará.
- [ ] La app abre y puedo mostrar su función central.
- [ ] Los controles producen una respuesta visible y validan los datos.
- [ ] El Canvas tiene relación con la propuesta.
- [ ] Los datos indicados en la propuesta siguen disponibles al reiniciar la app.
- [ ] Puedo ubicar y explicar el modelo, las funciones y las colecciones usadas.
- [ ] El `README.md` incluye descripción, captura, instrucciones y declaración de uso de IA.
- [ ] El repositorio tiene los cambios y el enlace está listo para compartir.

---

*ET0126 · Programación de Dispositivos Móviles · I.U. Pascual Bravo · Semestre agosto–noviembre de 2026*
