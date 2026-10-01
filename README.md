# Práctica Widget – Trabajo Grupal (Flutter)

Trabajo explicativo sobre 5 preguntas de Flutter. Cada respuesta incluye una
breve explicación teórica y un ejemplo sencillo funcionando dentro de la app.

**Instituto:** IESTPFFAA
**Integrantes del equipo:**
- Integrante 1: Antony Sedano Calderón — `sedanocalderonantony04`
- Integrante 2: _(escribir nombre)_

---

## 1. ¿Qué es un widget?

**Teoría:** Un widget es cada bloque con el que se construye la interfaz en
Flutter: un texto, un botón, una imagen, una fila o incluso una pantalla
completa son widgets. Todo lo que ves en una app Flutter está formado por
widgets.

**Ejemplo (pantalla 1 de la app):**
```dart
Column(
  children: [
    const Text('Soy un widget Text'),
    ElevatedButton(
      onPressed: () {},
      child: const Text('Soy un widget ElevatedButton'),
    ),
  ],
)
```

## 2. Diferencia entre StatelessWidget y StatefulWidget

**Teoría:** `StatelessWidget` no mantiene estado interno: su contenido no
cambia durante la ejecución. `StatefulWidget` sí puede cambiar su interfaz
mientras la app funciona, porque guarda su estado en un objeto `State`
(creado por `createState()`).

**Ejemplo (pantalla 2):** un `ListTile` estático (Stateless) junto a un
mini contador que sí cambia (Stateful).
```dart
class MiniContador extends StatefulWidget {
  const MiniContador({super.key});
  @override
  State<MiniContador> createState() => _MiniContadorState();
}
```

## 3. ¿Para qué sirve setState()?

**Teoría:** `setState()` indica a Flutter que un dato del estado cambió y que
la interfaz debe actualizarse: al llamarlo se vuelve a ejecutar `build()` y la
pantalla se reconstruye con el nuevo valor. Sin `setState()`, el dato cambia
pero la pantalla no se entera.

**Ejemplo (pantalla 3):** contador que sube al pulsar el botón.
```dart
void incrementar() {
  setState(() {
    contador++;
  });
}
```

## 4. ¿Qué widget organiza elementos horizontalmente?

**Teoría:** El widget `Row` organiza sus hijos en una fila horizontal
(`Column` hace lo mismo en vertical).

**Ejemplo (pantalla 4):** tres cajas de colores alineadas en fila.
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: const [
    _CajaColor(color: Colors.red, nombre: 'A'),
    _CajaColor(color: Colors.green, nombre: 'B'),
    _CajaColor(color: Colors.blue, nombre: 'C'),
  ],
)
```

## 5. ¿Qué widget permite crear listas?

**Teoría:** El widget `ListView` crea listas de elementos desplazables
(scroll). Se usa con `children` para pocos elementos o con `ListView.builder`
para listas largas generadas desde datos. El menú principal de esta app
también es un `ListView`.

**Ejemplo (pantalla 5):** lista de 10 elementos con scroll.
```dart
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, indice) {
    return ListTile(
      leading: CircleAvatar(child: Text('${indice + 1}')),
      title: Text('Elemento ${indice + 1}'),
    );
  },
)
```

---

## Ejecutar el proyecto

```bash
flutter pub get
flutter run
```

## Prueba automatizada

```bash
flutter test
```
Resultado esperado: `All tests passed!`

## Estructura relevante

```
practica_widget/
├── lib/
│   └── main.dart          ← App completa: menú + 5 pantallas (teoría y ejemplo)
├── test/
│   └── widget_test.dart   ← Prueba del menú
└── pubspec.yaml
```