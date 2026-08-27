# Ejercicio práctico de Dart: carrito de compras

**Asignatura:** ET0126 – Programación de Dispositivos Móviles  
**Modalidad:** Individual o en parejas  
**Herramienta:** [DartPad](https://dartpad.dev/)  

## Objetivo

Aplicar los conceptos básicos de Dart vistos en clase mediante el desarrollo de un pequeño carrito de compras.

En este ejercicio se practicarán:

- Variables y tipos de datos.
- *Null safety*.
- Funciones.
- `List`, `Map` y `Set`.
- Condicionales.
- Ciclos.
- Interpolación de cadenas.

> **Importante:** para este ejercicio no se deben utilizar clases.

## Contexto

Una tienda necesita un programa sencillo que permita consultar sus productos, validar una compra y calcular el valor que debe pagar un cliente.

El programa se ejecutará completamente en la consola de DartPad. Los datos de la compra pueden definirse directamente en el código; todavía no es necesario solicitar información mediante teclado.

## Datos iniciales

Crea una lista de productos utilizando mapas. Cada producto debe tener un nombre, un precio y una cantidad disponible.

Puedes utilizar estos datos como punto de partida:

```dart
List<Map<String, dynamic>> productos = [
  {
    'nombre': 'Audífonos',
    'precio': 80000.0,
    'cantidad': 4,
  },
  {
    'nombre': 'Teclado',
    'precio': 120000.0,
    'cantidad': 2,
  },
  {
    'nombre': 'Mouse',
    'precio': 60000.0,
    'cantidad': 0,
  },
];
```

## Requerimientos

### 1. Mostrar el inventario

Crea una función llamada `mostrarProductos()` que reciba la lista, la recorra e imprima la información de cada producto.

Por cada producto se debe mostrar:

- Nombre.
- Precio.
- Cantidad disponible.

### 2. Manejar el nombre del cliente

Define el nombre del cliente mediante una variable que pueda contener `null`:

```dart
String? nombreCliente;
```

Si el nombre es `null` o está vacío, el programa debe utilizar el texto `Cliente invitado`.

### 3. Simular una compra

Define dentro del programa:

- El nombre del producto que desea comprar el cliente.
- La cantidad de unidades solicitadas.

Ejemplo:

```dart
String productoSolicitado = 'Teclado';
int cantidadSolicitada = 2;
```

### 4. Buscar y validar el producto

Recorre la lista para encontrar el producto solicitado. El programa debe validar los siguientes casos:

- El producto no existe.
- La cantidad solicitada es igual o menor que cero.
- El producto está agotado.
- La cantidad solicitada supera las unidades disponibles.
- La compra puede realizarse correctamente.

Cuando no haya suficientes unidades, el programa debe informar cuántas quedan disponibles.

### 5. Crear las funciones de cálculo

Implementa las siguientes funciones:

```dart
double calcularSubtotal(double precio, int cantidad)
double calcularDescuento(double subtotal)
double calcularTotal(double subtotal, double descuento)
```

Cada función debe retornar el resultado correspondiente.

### 6. Calcular el descuento

Utiliza las siguientes reglas:

| Subtotal de la compra | Descuento |
|---|---:|
| Menor de $100.000 | 0 % |
| Desde $100.000 hasta menos de $200.000 | 5 % |
| Desde $200.000 | 10 % |

El descuento debe calcularse como un valor monetario. Por ejemplo, si el subtotal es `$240.000`, el descuento del 10 % corresponde a `$24.000`.

### 7. Mostrar el resumen

Si la compra es válida, imprime un resumen similar al siguiente:

```text
===== RESUMEN DE COMPRA =====
Cliente: Juan
Producto: Teclado
Cantidad: 2
Subtotal: $240000.0
Descuento: $24000.0
Total a pagar: $216000.0
Gracias por tu compra
```

## Condiciones obligatorias

La solución debe cumplir con todo lo siguiente:

- Ejecutarse desde la función `main()`.
- No utilizar clases.
- Utilizar al menos una variable nullable con `?`.
- Utilizar una `List`.
- Utilizar uno o varios `Map`.
- Implementar como mínimo tres funciones.
- Utilizar al menos un ciclo.
- Utilizar `if`, `else if` y `else`.
- Utilizar interpolación de cadenas con `$`.
- Mostrar mensajes claros para cada validación.

## Pruebas mínimas

Ejecuta el programa varias veces, modificando los datos de la compra para comprobar estos escenarios:

1. Compra válida sin descuento.
2. Compra válida con descuento.
3. Producto inexistente.
4. Producto agotado.
5. Cantidad solicitada superior al inventario.
6. Cantidad igual o menor que cero.
7. Cliente sin nombre.

## Retos opcionales

Si terminas los requerimientos principales, intenta agregar una o varias mejoras:

1. Descontar del inventario las unidades vendidas.
2. Permitir procesar varios productos y acumular el total.
3. Agregar una categoría a cada producto.
4. Crear un `Set` con las categorías para evitar valores repetidos.
5. Mostrar cuántos productos están disponibles y cuántos están agotados.
6. Aplicar envío gratuito cuando el total sea igual o superior a `$250.000`.

## Entrega

Entrega los siguientes elementos:

1. Enlace público del ejercicio en DartPad.
2. Captura de pantalla del resultado de una compra válida.
3. Explicación breve de cuál validación fue la más difícil y cómo la solucionaste.

## Criterios de revisión

| Criterio | Valor |
|---|---:|
| Uso correcto de variables, listas y mapas | 20 % |
| Funciones y cálculos | 25 % |
| Condicionales, ciclos y validaciones | 25 % |
| Uso de null safety | 10 % |
| Claridad, orden y funcionamiento del código | 20 % |

> La inteligencia artificial puede utilizarse como apoyo para comprender errores o consultar conceptos. El estudiante debe poder explicar el código entregado y realizar modificaciones durante la revisión.
