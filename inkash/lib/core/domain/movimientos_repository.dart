// Capa de dominio: Dart puro, sin dependencias de Flutter.

import 'movimiento.dart';
import 'presupuesto.dart';

/// Contrato de acceso a datos.
///
/// El dominio define QUE se necesita; la capa `core/repository` decide COMO se
/// obtiene (hoy en memoria, manana con sqflite). Esta inversion es lo que
/// permite cambiar la fuente de datos sin tocar la pantalla.
abstract interface class MovimientosRepository {
  /// Todos los movimientos, del mas reciente al mas antiguo.
  Future<List<Movimiento>> obtenerMovimientos();

  /// Los [limite] movimientos mas recientes, para la seccion de Inicio.
  Future<List<Movimiento>> obtenerUltimos({int limite = 3});

  /// El presupuesto vigente del mes indicado.
  Future<Presupuesto> obtenerPresupuesto(DateTime mes);
}
