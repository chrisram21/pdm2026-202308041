import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kLime = Colors.lime;

Widget filaMovimiento({
  required IconData icon,
  required String title,
  required String subtitle,
  required String amount,
  required String date,
  bool isIncome = false,
}){
  return ListTile(
    leading: Icon(icon, color: kLime),
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [Text(amount, style:TextStyle(color: isIncome ? kLime : const Color.fromARGB(255, 226, 225, 220))), Text(date)],
    ),
  );
}

Widget tarjetaHero(
    double pad,
    double marg,
    String title,
    String amount,
    Color color,
){
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(pad),
      margin: EdgeInsets.all(marg),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 8, color: Colors.white)),
          Text(amount, style: TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkash',
      theme: ThemeData(
        brightness: Brightness.dark,
       scaffoldBackgroundColor: Color.fromARGB(255, 38, 37, 36),
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Hola, Animal'), Text('Julio 2026')],
              ),
              const SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('TE QUEDAN DISPONIBLES', style: TextStyle(fontSize: 11,   color: kLime)),
                  SizedBox(height: 6),
                  Text('Q1,989.13', style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  LinearProgressIndicator(value: 0.57,  color: kLime, backgroundColor: Color(0xFF555555)),
                  SizedBox(height: 7),
                  Text(
                    'Has usado Q3,703.50 de Q6,500.00',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [  
                   tarjetaHero(10, 10, 'Cuentas', 'Q1,989.13', Color.fromARGB(255, 42, 41, 38)),
                  tarjetaHero(10, 10, 'Metas de ahorro', '4 activas', Color.fromARGB(255, 42, 41, 38)),
                  ],
                ),

              ] 
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ultimos movimientos', style: TextStyle(fontSize: 16)), 
                   Text('Ver todos', style: TextStyle(fontSize: 12, color: kLime)),],
              ),
               ListTile(
              leading: Icon(Icons.directions_bus_filled, color: kLime),
              title: Text('Uber al trabajo'),
              subtitle: Text('Transporte'),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [Text('- Q48.00'), Text('Ayer')],),
            ),
            Divider(height: 0),
            filaMovimiento(
              icon: Icons.shopping_cart,
              title: 'Super La torre',
              subtitle: 'Super y comida - Tarjeta',
              amount: '- Q1,200.00',
              date: 'Ayer'
            ),
            Divider(height: 0),
            filaMovimiento(
              icon: Icons.arrow_upward,
              title: 'Salario quincena',
              subtitle: 'Ingreso - Banco',
              amount: '+ Q1,200.00',
              date: 'Ayer',
              isIncome: true,
            ), //Lista
            
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 47, 44, 44),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: kLime), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Cuentas'),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Tarjetas'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}