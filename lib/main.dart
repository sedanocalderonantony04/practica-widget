import 'package:flutter/material.dart';

// ============================================================
// TRABAJO GRUPAL - 5 preguntas con teoría y ejemplo en Flutter
// Proyecto: practica_widget
// ============================================================

void main() {
  runApp(const TrabajoGrupal());
}

class TrabajoGrupal extends StatelessWidget {
  const TrabajoGrupal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trabajo Grupal',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// ---------------- MENÚ PRINCIPAL (ListView con las 5 preguntas) ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _irA(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trabajo Grupal - Flutter')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('1. ¿Qué es un widget?'),
            onTap: () => _irA(context, const P1WidgetScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.compare_arrows),
            title: const Text('2. StatelessWidget vs StatefulWidget'),
            onTap: () => _irA(context, const P2DiferenciaScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('3. ¿Para qué sirve setState()?'),
            onTap: () => _irA(context, const P3SetStateScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.table_rows), // ← corregido (con "s")
            title: const Text('4. Widget que organiza en horizontal'),
            onTap: () => _irA(context, const P4RowScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('5. Widget que permite crear listas'),
            onTap: () => _irA(context, const P5ListViewScreen()),
          ),
        ],
      ),
    );
  }
}

// ---------------- WIDGET REUTILIZABLE PARA LA TEORÍA ----------------
class Teoria extends StatelessWidget {
  const Teoria({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('TEORÍA', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(texto),
          ],
        ),
      ),
    );
  }
}

// ---------------- PREGUNTA 1: ¿Qué es un widget? ----------------
class P1WidgetScreen extends StatelessWidget {
  const P1WidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1. ¿Qué es un widget?')),
      body: ListView(
        children: [
          const Teoria(
            texto:
                'Un widget es cada bloque con el que se construye la interfaz en '
                'Flutter: un texto, un botón, una imagen, una fila o incluso una '
                'pantalla completa son widgets. Todo lo que ves en una app Flutter '
                'está formado por widgets.',
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'EJEMPLO',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              const Text('Soy un widget Text'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Soy un widget ElevatedButton'),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.amber.shade100,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.widgets),
                    SizedBox(width: 8),
                    Text('Container, Icon y Row también son widgets'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ---------------- PREGUNTA 2: Stateless vs Stateful ----------------
class P2DiferenciaScreen extends StatelessWidget {
  const P2DiferenciaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2. Stateless vs Stateful')),
      body: ListView(
        children: [
          const Teoria(
            texto:
                'StatelessWidget: no mantiene estado interno; su contenido no '
                'cambia durante la ejecución. StatefulWidget: su interfaz puede '
                'cambiar mientras la app funciona, porque guarda su estado en un '
                'objeto State. Abajo verás un widget estático y uno que cambia.',
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'EJEMPLO',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Card(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('StatelessWidget'),
              subtitle: Text('Este texto nunca cambia solo.'),
            ),
          ),
          const Card(
            margin: EdgeInsets.all(12),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text('StatefulWidget:'),
                  SizedBox(height: 8),
                  MiniContador(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget con estado usado como ejemplo en la pregunta 2
class MiniContador extends StatefulWidget {
  const MiniContador({super.key});

  @override
  State<MiniContador> createState() => _MiniContadorState();
}

class _MiniContadorState extends State<MiniContador> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () => setState(() => contador++),
          child: const Text('Sumar'),
        ),
      ],
    );
  }
}

// ---------------- PREGUNTA 3: ¿Para qué sirve setState()? ----------------
class P3SetStateScreen extends StatefulWidget {
  const P3SetStateScreen({super.key});

  @override
  State<P3SetStateScreen> createState() => _P3SetStateScreenState();
}

class _P3SetStateScreenState extends State<P3SetStateScreen> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3. ¿Para qué sirve setState()?')),
      body: ListView(
        children: [
          const Teoria(
            texto:
                'setState() indica a Flutter que un dato del estado cambió y que '
                'la interfaz debe actualizarse: al llamarlo se vuelve a ejecutar '
                'build() y la pantalla se reconstruye con el nuevo valor. Sin '
                'setState(), el dato cambia pero la pantalla no se actualiza.',
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'Contador: $contador',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: incrementar,
                  child: const Text('Incrementar con setState()'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ---------------- PREGUNTA 4: Widget horizontal (Row) ----------------
class P4RowScreen extends StatelessWidget {
  const P4RowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4. Row (horizontal)')),
      body: ListView(
        children: [
          const Teoria(
            texto:
                'El widget Row organiza sus elementos horizontalmente, en una '
                'fila. Su compañero Column hace lo mismo pero en vertical.',
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _CajaColor(color: Colors.red, nombre: 'A'),
              _CajaColor(color: Colors.green, nombre: 'B'),
              _CajaColor(color: Colors.blue, nombre: 'C'),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _CajaColor extends StatelessWidget {
  const _CajaColor({required this.color, required this.nombre});

  final Color color;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      color: color,
      child: Text(
        nombre,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

// ---------------- PREGUNTA 5: Widget de listas (ListView) ----------------
class P5ListViewScreen extends StatelessWidget {
  const P5ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('5. ListView (listas)')),
      body: Column(
        children: [
          const Teoria(
            texto:
                'El widget ListView permite crear listas de elementos '
                'desplazables (con scroll). Se usa con children para pocos '
                'elementos, o con ListView.builder para listas largas generadas '
                'a partir de datos. El menú principal de esta app también es un '
                'ListView.',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, indice) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${indice + 1}')),
                  title: Text('Elemento ${indice + 1}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
