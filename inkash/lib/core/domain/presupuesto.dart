// Capa de dominio: Dart puro, sin dependencias de Flutter.

/// Los datos del mes que NO se derivan de los movimientos: cuanto se propuso
/// gastar el usuario, cuanto tiene realmente en sus cuentas y cuantas metas de
/// ahorro lleva activas.
class Presupuesto {
  const Presupuesto({
    required this.mes,
    required this.montoMensual,
    required this.saldoEnCuentas,
    required this.metasActivas,
  });

  /// Mes al que aplica. Se usa el dia 1 como convencion.
  final DateTime mes;

  /// Techo que el usuario se puso para el mes.
  final double montoMensual;

  /// Dinero real disponible sumando todas sus cuentas.
  final double saldoEnCuentas;

  final int metasActivas;
}
