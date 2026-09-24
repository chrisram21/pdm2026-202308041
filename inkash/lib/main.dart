import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'database_helper.dart';

import 'app.dart';

/// Punto de entrada. Lo unico que hace es arrancar la app dentro de un
/// [ProviderScope], que es el contenedor donde viven todos los providers.
/// Toda la configuracion (tema, rutas) vive en `app.dart`.
void main() async { //Future
  WidgetsFlutterBinding.ensureInitialized(); // necesario antes de usar plugins nativos como sqflite

    // Inicializa el motor FFI de sqflite para desktop (Windows/Linux/macOS)
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  await DatabaseHelper().initDB();
  runApp(const ProviderScope(child: InkashApp()));
}
