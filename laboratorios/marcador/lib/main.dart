import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.amber),
      ),
      home: const MyHomePage(title: 'Marcador de equipos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter_1 = 0;
  int _counter_2 = 0;
  bool _empate = true;

  void _revisionEmpate() {
    setState(() {
      if (_counter_1 == _counter_2) {
        _empate = true;
      } else {
        _empate = false;
      }
    });
  }
  void _incrementCounter1() {
    setState(() {
      _counter_1++;
      _revisionEmpate();
    });
  }

  void _decrementCounter1() {
    setState(() {
      if (_counter_1 > 0)
      {
        _counter_1--;
        _revisionEmpate();
      }
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter_2++;
      _revisionEmpate();
    });
  }

  void _decrementCounter2() {
    setState(() {
      if (_counter_2 > 0)
      {
              _counter_2--;
              _revisionEmpate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const equipo1 = 'Ladybug';
    const equipo2 = 'Los Avengers';
    final ganador = _counter_1 > _counter_2 ? equipo1 : equipo2;
    const imagenURL2 = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHRGJsoX0y4C1kbmOSCdwzH0oXITkvdU1m-RXJJjh8R28R6D9qKG_yPIQu&s=10';
    const imagenURL1 = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOQ6w4hpIAkZWycv5FY_eylgR2Gd_C5X7v1zziEsH-5YFumwRZvbC9s60&s=10SS';

    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            // Los dos equipos lado a lado, cada uno con su marcador y botones
            Row(
              children: [
                Expanded(
                  child: _buildEquipo(
                    equipo1,
                    _counter_1,
                    _counter_1 > _counter_2,
                    _incrementCounter1,
                    _decrementCounter1,
                    imagenURL1,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildEquipo(
                    equipo2,
                    _counter_2,
                    _counter_2 > _counter_1,
                    _incrementCounter2,
                    _decrementCounter2,
                    imagenURL2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              _empate ? 'Empate' : 'No hay empate',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 5),
            if (!_empate)
              Text(
                'Va ganando $ganador',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter_1 = 0;
                  _counter_2 = 0;
                  _empate = true;
                });
              },
              child: const Text('Reiniciar marcador'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipo(
    String nombre,
    int puntos,
    bool ganando,
    VoidCallback onIncrement,
    VoidCallback onDecrement,
    String imagenURL,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          children: [
            Image.network(imagenURL, height: 100, width: 100),
            Text(
              nombre,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ganando ? Colors.green : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$puntos',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: onDecrement,
                  tooltip: 'Decrement',
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                IconButton.filled(
                  onPressed: onIncrement,
                  tooltip: 'Increment',
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
