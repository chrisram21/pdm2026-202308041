// Capa de dominio: Dart puro, sin dependencias de Flutter.

import 'movimiento.dart';
import 'presupuesto.dart';

/// Lo que la pantalla de Inicio necesita saber del mes.
///
/// Aqui viven las reglas de negocio de la pantalla (cuanto se gasto, que tan
/// lleno esta el presupuesto). Al ser Dart puro se pueden probar sin levantar
/// la app ni la base de datos.
class ResumenInicio {
  const ResumenInicio({
    required this.mes,
    required this.saldoDisponible,
    required this.presupuestoMensual,
    required this.gastadoEnElMes,
    required this.metasActivas,
  });

  /// Calcula el resumen a partir de los movimientos del mes y el presupuesto.
  ///
  /// Solo cuenta los movimientos que caen dentro del mes del presupuesto: un
  /// gasto de junio no debe ensuciar el avance de julio.
  factory ResumenInicio.calcular({
    required List<Movimiento> movimientos,
    required Presupuesto presupuesto,
  }) {
    final delMes = movimientos.where(
      (m) =>
          m.fecha.year == presupuesto.mes.year &&
          m.fecha.month == presupuesto.mes.month,
    );

    final gastado = delMes
        .where((m) => !m.esIngreso)
        .fold<double>(0, (suma, m) => suma + m.monto);

    return ResumenInicio(
      mes: presupuesto.mes,
      saldoDisponible: presupuesto.saldoEnCuentas,
      presupuestoMensual: presupuesto.montoMensual,
      gastadoEnElMes: gastado,
      metasActivas: presupuesto.metasActivas,
    );
  }

  final DateTime mes;

  /// Dinero real que le queda hoy al usuario.
  final double saldoDisponible;

  final double presupuestoMensual;
  final double gastadoEnElMes;
  final int metasActivas;

  /// Cuanto le queda del techo que se puso para el mes.
  double get restanteDelPresupuesto => presupuestoMensual - gastadoEnElMes;

  /// Avance del presupuesto entre 0 y 1, listo para la barra de progreso.
  /// Se acota a 1 para que pasarse del presupuesto no rompa el indicador.
  double get avanceDelPresupuesto {
    if (presupuestoMensual <= 0) return 0;
    return (gastadoEnElMes / presupuestoMensual).clamp(0.0, 1.0);
  }

  /// True cuando el usuario ya se paso de lo que se propuso gastar.
  bool get presupuestoExcedido => gastadoEnElMes > presupuestoMensual;
}
