# Taller final: presenta y prepara el lanzamiento de tu app

**I.U. Pascual Bravo · ET0126 · Programación de Dispositivos Móviles**  
**Modalidad:** individual  
**Entrega máxima:** domingo 29 de noviembre de 2026, 11:59 p. m., hora de Colombia.  
**Después de esa fecha y hora no se aceptan entregas.**  
**Evaluación:** taller 70 % y exposición 30 %.

## El reto

Imagina que vas a lanzar tu aplicación en una tienda como Google Play. Tu tarea es presentar el producto, demostrar cómo funciona y preparar los materiales que necesita una persona para conocerlo, instalarlo y decidir si quiere usarlo.

Continúa con la aplicación Flutter que desarrollaste durante el curso, incluido el último avance de autenticación con Firebase. No es necesario publicar la app en una tienda ni pagar una cuenta de desarrollador: entregarás una **simulación de lanzamiento** en tu propio repositorio.

## 1. Prepara tu aplicación

Deja una versión que puedas demostrar en un dispositivo Android o emulador. Como mínimo, muestra:

- El inicio de la aplicación y su recorrido principal.
- La autenticación con Firebase: inicio y cierre de sesión, y qué ocurre al ingresar credenciales inválidas.
- Una acción útil para el usuario, con su resultado y una validación de datos.
- Los componentes más relevantes que desarrollaste durante el curso, como almacenamiento, servicios, manejo de estado o Canvas, cuando hagan parte de tu app.

Prueba el recorrido antes de la exposición. Si alguna función está incompleta, indícalo en el repositorio y explícalo durante la presentación.

## 2. Investiga y genera una APK

Investiga cómo se construye una APK de Android en Flutter y genera una versión instalable de tu aplicación. Prueba que se instala y abre en un dispositivo o emulador, y que permite demostrar la autenticación y el recorrido principal.

Documenta en el `README.md` los requisitos, comandos que utilizaste, ubicación de la APK, pasos de instalación y resultado de la prueba. Explica qué diferencia hay entre la APK que entregas y un paquete preparado para publicación en Google Play. Identifica qué formato solicita actualmente la tienda para una publicación nueva y cita la fuente que consultaste.

Sube la APK al repositorio, por ejemplo en `entrega/app.apk`. No subas contraseñas, claves de firma, archivos de cuenta de servicio ni datos sensibles. No se exige una firma de producción ni publicar en Google Play.

## 3. Diseña la ficha de tu aplicación para la tienda

Crea un archivo `ficha_tienda.md` en el repositorio con una propuesta dirigida a los posibles usuarios. Incluye:

1. **Nombre de la aplicación y categoría propuesta.**
2. **Descripción corta:** una frase que explique su beneficio principal.
3. **Descripción completa:** para quién es, qué problema resuelve y cuáles son sus funciones principales.
4. **Público objetivo** y una explicación breve de por qué la app le resulta útil.
5. **Ícono propuesto** y al menos **tres capturas reales** de la aplicación, con una frase que explique cada una.
6. **Datos y permisos:** qué información maneja la app, para qué usa la autenticación y qué permisos solicita, si aplica.
7. **Política de privacidad propuesta:** explica de forma sencilla qué datos se recogen, para qué se usan y cómo podría el usuario solicitar ayuda o eliminación. Si aún no implementaste alguna función, señala qué falta por definir.
8. **Estado de lanzamiento:** versión propuesta, funciones listas, limitaciones conocidas y mejoras futuras.

La ficha es una propuesta para el ejercicio. Debe describir lo que tu aplicación hace realmente y no incluir promesas que no puedas demostrar.

## 4. Prepara la presentación

Elabora una presentación para mostrar tu app como si estuvieras presentándola a usuarios o a un equipo que decidirá si está lista para lanzarse. Súbela a tu repositorio en formato PDF o PowerPoint. Puedes usar esta estructura:

1. **Portada:** nombre de la app, tu nombre y una frase que resuma su propósito.
2. **Problema y usuario:** a quién ayudas y qué necesidad identificaste.
3. **Propuesta de valor:** cómo resuelve el problema y qué la hace útil.
4. **Funciones y recorrido:** qué puede hacer una persona desde que entra a la app.
5. **Demostración:** muestra la aplicación en ejecución, incluyendo autenticación y una acción principal.
6. **Preparación para la tienda:** presenta el ícono, las capturas, la descripción, los datos que maneja y el estado de la APK.
7. **Decisiones y próximos pasos:** explica una decisión técnica, una dificultad, una limitación y una mejora futura.

No necesitas llenar las diapositivas de código. Usa imágenes y textos breves para apoyar tu explicación; prepárate para abrir el repositorio y explicar la implementación cuando te pregunten.

## 5. Entrega en tu repositorio

**Recomendación:** crea un repositorio nuevo en GitHub dedicado a la presentación y al lanzamiento de tu app. Así el docente encontrará fácilmente todos los materiales para calificarlos. En el `README.md` de ese repositorio incluye un enlace accesible al repositorio donde está el código fuente de tu aplicación. No necesitas duplicar el código.

Organiza los materiales en tu repositorio de presentación, por ejemplo:

```text
tu-repositorio-de-presentacion/
  README.md                    Descripción, enlace al código, pruebas y generación de APK
  ficha_tienda.md              Propuesta de ficha y privacidad
  entrega/
    app.apk                    APK generada
    presentacion.pdf o .pptx   Presentación de lanzamiento
    capturas/                  Ícono y capturas de la app
```

Puedes usar tu repositorio actual si prefieres, siempre que los materiales estén identificados y sean fáciles de encontrar. En el repositorio del código incluye los archivos de configuración necesarios para ejecutar el proyecto, sin secretos.

En el `README.md` agrega tu nombre, el propósito y las funciones de la app, el enlace al código fuente, instrucciones de ejecución e instalación de la APK, pasos de generación, resultados de pruebas, limitaciones y una declaración de uso de IA, si corresponde. Verifica que el docente pueda acceder a ambos repositorios y descargar los archivos.

Comparte el enlace en el canal de Google Chat del curso con este formato:

```text
ET0126 — Lanzamiento de mi app
Estudiante: [nombre completo]
Aplicación: [nombre]
Repositorio: [enlace]
Repositorio del código: [enlace, si es diferente]
```

**El repositorio completo y el mensaje deben estar disponibles a más tardar el domingo 29 de noviembre de 2026 a las 11:59 p. m., hora de Colombia. Después de ese momento no se aceptan entregas.**

## 6. Exposición individual

Prepara una exposición de **5 a 7 minutos**, seguida de preguntas. Presenta tu app como un producto que busca llegar a sus usuarios: explica el problema, muestra la solución en funcionamiento y enseña la ficha y la APK preparadas para el lanzamiento. La fecha y modalidad de exposición serán comunicadas por el docente.

Durante la demostración muestra el inicio de sesión y el recorrido principal, incluyendo una validación y su resultado. Explica qué está listo para lanzamiento y qué falta. Si ocurre un problema técnico, muestra la evidencia disponible y explica la limitación.

## Evaluación sobre 5,0

**Nota final = nota del taller × 0,70 + nota de la exposición × 0,30.** Cada componente se califica de 0,0 a 5,0. Los porcentajes siguientes corresponden a la nota total.

### Taller — 70 %

| Criterio | Peso | Evidencia |
| --- | ---: | --- |
| Aplicación y autenticación | 20 % | El recorrido principal funciona y se demuestra la autenticación con Firebase y el manejo de errores. |
| Investigación y APK | 15 % | La APK está disponible y probada; se explican su generación, instalación y formato para una publicación real. |
| Ficha simulada de tienda | 15 % | Presenta descripción, público, funciones, ícono, capturas, datos, privacidad y estado de lanzamiento coherentes con la app. |
| Presentación de lanzamiento | 10 % | Organiza el problema, la propuesta, el recorrido, la preparación de tienda y los próximos pasos con apoyo visual claro. |
| Repositorio y documentación | 10 % | Entrega accesible y completa, instrucciones, pruebas, limitaciones y declaración de uso de IA. |
| **Subtotal** | **70 %** | |

### Exposición — 30 %

| Criterio | Peso | Evidencia |
| --- | ---: | --- |
| Presentación del producto | 8 % | Explica el usuario, el problema y el valor de la solución. |
| Demostración | 10 % | Muestra autenticación, recorrido, validación y resultado; presenta la APK. |
| Lanzamiento y dominio de la app | 9 % | Explica la ficha, datos, decisiones técnicas, limitaciones y responde preguntas. |
| Comunicación | 3 % | Expone con claridad y organiza el tiempo. |
| **Subtotal** | **30 %** | |
| **Total** | **100 %** | |

## Antes de entregar

- [ ] Mi aplicación inicia y puedo demostrar el acceso y su función principal.
- [ ] Generé y probé la APK; expliqué su construcción e instalación.
- [ ] La ficha de tienda describe lo que la app realmente hace e incluye ícono y capturas.
- [ ] La presentación está lista para explicar y demostrar el producto.
- [ ] APK, ficha, presentación, capturas y README están en un repositorio accesible y fácil de revisar; el código también es accesible desde el enlace incluido.
- [ ] Envié el enlace a más tardar el **29 de noviembre de 2026 a las 11:59 p. m.**

---

*ET0126 · Programación de Dispositivos Móviles · I.U. Pascual Bravo · 2026*
