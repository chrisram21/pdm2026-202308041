import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Punto de entrada. Lo unico que hace es arrancar la app dentro de un
/// [ProviderScope], que es el contenedor donde viven todos los providers.
/// Toda la configuracion (tema, rutas) vive en `app.dart`.
void main() {
  runApp(const ProviderScope(child: InkashApp()));
}
