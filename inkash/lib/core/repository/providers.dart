import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/movimiento.dart';
import '../domain/movimientos_repository.dart';
import '../domain/resumen_inicio.dart';
import 'movimientos_repository_memoria.dart';

/// Punto unico de inyeccion de dependencias.
///
/// Para migrar a sqflite solo se cambia el `return` de este provider por
/// `MovimientosRepositorySqflite(...)`. La pantalla no se toca.
final movimientosRepositoryProvider = Provider<MovimientosRepository>((ref) {
  return MovimientosRepositoryMemoria();
});

/// Los ultimos movimientos que se muestran en la seccion de Inicio.
final ultimosMovimientosProvider = FutureProvider<List<Movimiento>>((ref) async {
  final repositorio = ref.watch(movimientosRepositoryProvider);
  return repositorio.obtenerUltimos(limite: 3);
});

/// Resumen del mes en curso: saldo, avance del presupuesto y metas activas.
///
/// El provider solo orquesta (pide datos y los junta); el calculo real vive en
/// [ResumenInicio.calcular], dentro del dominio.
final resumenInicioProvider = FutureProvider<ResumenInicio>((ref) async {
  final repositorio = ref.watch(movimientosRepositoryProvider);
  final ahora = DateTime.now();
  final mes = DateTime(ahora.year, ahora.month);

  final movimientos = await repositorio.obtenerMovimientos();
  final presupuesto = await repositorio.obtenerPresupuesto(mes);

  return ResumenInicio.calcular(movimientos: movimientos, presupuesto: presupuesto);
});
