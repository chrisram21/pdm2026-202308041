import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const kPrimary = Color.fromARGB(255, 16, 20, 42);
const kBorder = Color(0xFFDCDCE6);
const kGrey = Colors.grey;


Widget tarjetaHero({
    required double pad,
    required double marg,
    required String title,
    required String accion,
    required Color color,
    required List<Widget> hijos
}){
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(pad),
      margin: EdgeInsets.all(marg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorder),
      ),
       child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Text(accion, style: const TextStyle(fontSize: 13, color: kPrimary, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 14),
        ...hijos,
        //Solo como aclaracion este apartado de ...hijos lo aprendi a usar despues de la ultima entrega pq queria ver como hacer tablas que fueran mas facil de usar
      ],
    ),
    ),
  );
}

Widget filaInfo({
  required IconData icon, 
  required String label, 
  required String valor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: kGrey),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: kGrey)),
              const SizedBox(height: 2),
              Text(valor, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial1 - Pantalla 3',
      theme: ThemeData(
       scaffoldBackgroundColor: Color.fromARGB(255, 250, 249, 249),
      ),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))],
              ),
              const SizedBox(height: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFFE0E0EA),
                      child: Icon(Icons.person, size: 54, color: kGrey),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: kPrimary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                    ],
                    ),
                  const SizedBox(height: 8),
                  ]
              ),
              Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [  
                   tarjetaHero(
                    pad: 20,
                    marg: 10, 
                   title:'Personal info',
                   accion: 'Editar', 
                   color:Color.fromARGB(255, 42, 41, 38), 
                    hijos: [
                      filaInfo(icon: Icons.person, label: 'Nombre', valor: 'Christian Ramirez'),
                      filaInfo(icon: Icons.email, label: 'Correo', valor: 'christianramirez@gmail.com'),
                      filaInfo(icon: Icons.phone, label: 'Telefono', valor: '+502 1234 5678'),
                      filaInfo(icon: Icons.location_on, label: 'Direccion', valor: 'Ciudad de Guatemala, Guatemala'),
                    ]
                  ), 
                  ],
                ),

                ] 
              ),
              Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [  
                   tarjetaHero(
                    pad: 20,
                    marg: 10, 
                   title:'Account info',
                   accion: 'Editar', 
                   color:Color.fromARGB(255, 42, 41, 38), 
                    hijos: [
                      filaInfo(icon: Icons.account_balance, label: 'Banco', valor: 'Banco de Guatemala'),
                      filaInfo(icon: Icons.account_balance_wallet, label: 'Cuenta', valor: '1234567890'),
                      filaInfo(icon: Icons.credit_card, label: 'Tarjeta', valor: '**** **** **** 1234'),
                    ]
                  ), 
                  ],
                ),
                ] 
              ),   
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: kPrimary), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: 'Mapa'),
            BottomNavigationBarItem(icon: Icon(Icons.call_merge_outlined), label: 'Transferir'),
            BottomNavigationBarItem(icon: Icon(Icons.coronavirus_rounded), label: 'Ajustes'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}