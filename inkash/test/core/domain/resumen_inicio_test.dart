import 'package:flutter_test/flutter_test.dart';
import 'package:inkash/core/domain/movimiento.dart';
import 'package:inkash/core/domain/presupuesto.dart';
import 'package:inkash/core/domain/resumen_inicio.dart';

/// Estas pruebas corren sin levantar la app ni la base de datos: esa es la
/// ventaja concreta de tener las reglas en el dominio y no dentro del widget.
void main() {
  final julio = DateTime(2026, 7);

  Movimiento gasto(double monto, DateTime fecha) => Movimiento(
        id: 'g-${fecha.day}-$monto',
        titulo: 'Gasto',
        categoria: CategoriaMovimiento.otros,
        monto: monto,
        tipo: TipoMovimiento.gasto,
        fecha: fecha,
      );

  Movimiento ingreso(double monto, DateTime fecha) => Movimiento(
        id: 'i-${fecha.day}-$monto',
        titulo: 'Ingreso',
        categoria: CategoriaMovimiento.ingreso,
        monto: monto,
        tipo: TipoMovimiento.ingreso,
        fecha: fecha,
      );

  Presupuesto presupuestoDe(double monto) => Presupuesto(
        mes: julio,
        montoMensual: monto,
        saldoEnCuentas: 1989.13,
        metasActivas: 4,
      );

  test('suma solo los gastos del mes del presupuesto', () {
    final resumen = ResumenInicio.calcular(
      movimientos: [
        gasto(100, DateTime(2026, 7, 5)),
        gasto(50, DateTime(2026, 7, 20)),
        gasto(999, DateTime(2026, 6, 30)), // mes anterior: no cuenta
      ],
      presupuesto: presupuestoDe(1000),
    );

    expect(resumen.gastadoEnElMes, 150);
    expect(resumen.restanteDelPresupuesto, 850);
  });

  test('los ingresos no cuentan como gasto', () {
    final resumen = ResumenInicio.calcular(
      movimientos: [
        gasto(200, DateTime(2026, 7, 5)),
        ingreso(5000, DateTime(2026, 7, 6)),
      ],
      presupuesto: presupuestoDe(1000),
    );

    expect(resumen.gastadoEnElMes, 200);
  });

  test('el avance se acota a 1 cuando se excede el presupuesto', () {
    final resumen = ResumenInicio.calcular(
      movimientos: [gasto(1500, DateTime(2026, 7, 5))],
      presupuesto: presupuestoDe(1000),
    );

    expect(resumen.avanceDelPresupuesto, 1.0);
    expect(resumen.presupuestoExcedido, isTrue);
    expect(resumen.restanteDelPresupuesto, -500);
  });

  test('sin presupuesto definido el avance es 0 y no divide entre cero', () {
    final resumen = ResumenInicio.calcular(
      movimientos: [gasto(300, DateTime(2026, 7, 5))],
      presupuesto: presupuestoDe(0),
    );

    expect(resumen.avanceDelPresupuesto, 0);
  });
}
