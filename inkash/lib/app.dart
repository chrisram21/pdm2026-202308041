import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/home/home_screen.dart';

/// Configuracion de la aplicacion: titulo, tema y pantalla inicial.
///
/// Cuando existan mas pantallas, aqui es donde entra el router.
class InkashApp extends StatelessWidget {
  const InkashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inkash',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.oscuro,
      home: const HomeScreen(),
    );
  }
}
