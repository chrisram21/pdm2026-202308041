import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafeteria',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),
      home: const MyHomePage(title: 'Mi pedido'),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.onAgregar,
    required this.onQuitar,
  });

  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback onAgregar;
  final VoidCallback onQuitar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text('Q${precio.toStringAsFixed(2)}'),
              ],
            ),
          ),
          IconButton.outlined(
            onPressed: onQuitar,
            icon: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$cantidad',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton.outlined(
            onPressed: onAgregar,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _precioCafe = 10.00;
  final double _precioSandwich = 25.00;
  final double _precioJugo = 12.00;

  int _counter_cafe = 0;
  int _counter_sandwich = 0;
  int _counter_jugo = 0;

  double get _total =>
      _counter_cafe * _precioCafe +
      _counter_sandwich * _precioSandwich +
      _counter_jugo * _precioJugo;

  void _incrementCounterCafe() {
    setState(() {
      _counter_cafe++;
    });
  }

  void _decrementCounterCafe() {
    setState(() {
      if (_counter_cafe > 0) {
        _counter_cafe--;
      }
    });
  }

  void _incrementCounterSandwich() {
    setState(() {
      _counter_sandwich++;
    });
  }

  void _decrementCounterSandwich() {
    setState(() {
      if (_counter_sandwich > 0) {
        _counter_sandwich--;
      }
    });
  }

  void _incrementCounterJugo() {
    setState(() {
      _counter_jugo++;
    });
  }

  void _decrementCounterJugo() {
    setState(() {
      if (_counter_jugo > 0) {
        _counter_jugo--;
      }
    });
  }

  void _vaciarPedido() {
    setState(() {
      _counter_cafe = 0;
      _counter_sandwich = 0;
      _counter_jugo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ProductoPedido(
                  nombre: 'Café',
                  precio: _precioCafe,
                  cantidad: _counter_cafe,
                  onAgregar: _incrementCounterCafe,
                  onQuitar: _decrementCounterCafe,
                ),
                const Divider(height: 1),
                ProductoPedido(
                  nombre: 'Sándwich',
                  precio: _precioSandwich,
                  cantidad: _counter_sandwich,
                  onAgregar: _incrementCounterSandwich,
                  onQuitar: _decrementCounterSandwich,
                ),
                const Divider(height: 1),
                ProductoPedido(
                  nombre: 'Jugo',
                  precio: _precioJugo,
                  cantidad: _counter_jugo,
                  onAgregar: _incrementCounterJugo,
                  onQuitar: _decrementCounterJugo,
                ),
                const Divider(height: 1),
              ],
            ),
          ),
          const Divider(height: 1),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Q${_total.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _vaciarPedido,
                      child: const Text('Vaciar pedido'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}