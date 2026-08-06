import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kPrimary = Color.fromARGB(255, 126, 86, 4);
const kBorder = Color(0xFFDCDCE6);
const kHeaderBg = Color(0xFFEEF0FB);

Widget encabezadoTabla(List<String> titulos, List<int> flexes) {
  return Container(
    color: kHeaderBg,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    child: Row(
      children: [
        for (var i = 0; i < titulos.length; i++)
          Expanded(
            flex: flexes[i],
            child: Text(
              titulos[i],
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ),
      ],
    ),
  );
}

Widget botonMini(String texto) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: kPrimary),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(texto, style: const TextStyle(fontSize: 9, color: kPrimary)),
  );
}

Widget filaClienteHoy({
  required String nombre,
  required String numero,
  required String nota,
  bool contactado = false,
}) {
  return Container(
    decoration: const BoxDecoration(border: Border(top: BorderSide(color: kBorder))),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: Text(nombre, style: const TextStyle(fontSize: 13))),
        Expanded(flex: 2, child: Text(numero, style: const TextStyle(fontSize: 12))),
        Expanded(flex: 2, child: Text(nota, style: const TextStyle(fontSize: 12))),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Checkbox(
                value: contactado,
                onChanged: (_) {},
                activeColor: kPrimary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              botonMini('Ver'),
              const SizedBox(width: 4),
              botonMini('Actualizar'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget filaClienteMes({
  required String nombre,
  required String numero,
  required String producto,
  required String nota,
}) {
  return Container(
    decoration: const BoxDecoration(border: Border(top: BorderSide(color: kBorder))),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Row(
      children: [
        Expanded(flex: 2, child: Text(nombre, style: const TextStyle(fontSize: 13))),
        Expanded(flex: 2, child: Text(numero, style: const TextStyle(fontSize: 12))),
        Expanded(flex: 2, child: Text(producto, style: const TextStyle(fontSize: 12))),
        Expanded(flex: 2, child: Text(nota, style: const TextStyle(fontSize: 12))),
      ],
    ),
  );
}

Widget botonAccion(String texto) {
  return Expanded(
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: kPrimary,
        side: const BorderSide(color: kPrimary),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(texto, textAlign: TextAlign.center),
    ),
  );
}

Widget tituloSeccion(String texto) {
  return Text(
    texto,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kusdy',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F7FA),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: kPrimary),
            onPressed: () {},
          ),
          title: const Text(
            'Bienvenido',
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              tituloSeccion('Clientes para hoy'),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kBorder),
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    encabezadoTabla(['Nombre', 'Número', 'Nota', 'Acciones'], [2, 2, 2, 3]),
                    filaClienteHoy(nombre: 'Valeria', numero: '5836 9876', nota: 'Terraza', contactado: true),
                    filaClienteHoy(nombre: 'Hector', numero: '4836 1011', nota: 'Estructura'),
                    filaClienteHoy(nombre: 'Ana', numero: '1234 5678', nota: 'Llamar en la tarde'),
                    filaClienteHoy(nombre: 'Marcos', numero: '5511 2233', nota: 'Cotizar panel'),
                    filaClienteHoy(nombre: 'Sofía', numero: '4022 8890', nota: 'Enviar factura', contactado: true),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  botonAccion('Ventas del mes'),
                  const SizedBox(width: 12),
                  botonAccion('Ingresar cliente'),
                ],
              ),
              const SizedBox(height: 24),
              tituloSeccion('Clientes del mes'),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kBorder),
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    encabezadoTabla(['Nombre', 'Número', 'Producto', 'Nota'], [2, 2, 2, 2]),
                    filaClienteMes(nombre: 'Allan', numero: '2023 1010', producto: 'Panel', nota: 'Terraza'),
                    filaClienteMes(nombre: 'Pedro', numero: '1415 2021', producto: 'Calentador', nota: 'Estructura'),
                    filaClienteMes(nombre: 'Karla', numero: '3344 5566', producto: 'Panel', nota: 'Instalado'),
                    filaClienteMes(nombre: 'Diego', numero: '7788 9900', producto: 'Bomba de agua', nota: 'Pendiente de pago'),
                    filaClienteMes(nombre: 'Lucía', numero: '6600 1122', producto: 'Calentador', nota: 'Garantía'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimary,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Clientes'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Ventas'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}