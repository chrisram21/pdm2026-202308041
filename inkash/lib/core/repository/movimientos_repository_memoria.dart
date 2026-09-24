import '../domain/movimiento.dart';
import '../domain/movimientos_repository.dart';
import '../domain/presupuesto.dart';

/// Implementacion en memoria del [MovimientosRepository].
///
/// Sirve para tener la pantalla funcionando de punta a punta antes de escribir
/// una sola linea de sqflite. Cuando exista `MovimientosRepositorySqflite`,
/// se cambia una linea en `providers.dart` y ni el dominio ni la UI se enteran.
class MovimientosRepositoryMemoria implements MovimientosRepository {
  MovimientosRepositoryMemoria();

  /// Los datos de ejemplo se anclan a "ayer" para que las fechas relativas
  /// ("Ayer") sigan teniendo sentido sin importar cuando se abra la app.
  static final DateTime _ayer = () {
    final ahora = DateTime.now();
    return DateTime(ahora.year, ahora.month, ahora.day).subtract(const Duration(days: 1));
  }();

  static DateTime _hace(int dias, {int hora = 12}) =>
      _ayer.subtract(Duration(days: dias)).add(Duration(hours: hora));

  late final List<Movimiento> _movimientos = [
    Movimiento(
      id: '1',
      titulo: 'Uber al trabajo',
      categoria: CategoriaMovimiento.transporte,
      monto: 48.00,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(0, hora: 18),
    ),
    Movimiento(
      id: '2',
      titulo: 'Super La Torre',
      categoria: CategoriaMovimiento.superYComida,
      monto: 1200.00,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(0, hora: 15),
      medioDePago: 'Tarjeta',
    ),
    Movimiento(
      id: '3',
      titulo: 'Salario quincena',
      categoria: CategoriaMovimiento.ingreso,
      monto: 1200.00,
      tipo: TipoMovimiento.ingreso,
      fecha: _hace(0, hora: 9),
      medioDePago: 'Banco',
    ),
    Movimiento(
      id: '4',
      titulo: 'Recibo de luz',
      categoria: CategoriaMovimiento.servicios,
      monto: 385.50,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(2),
      medioDePago: 'Banco',
    ),
    Movimiento(
      id: '5',
      titulo: 'Gasolina',
      categoria: CategoriaMovimiento.transporte,
      monto: 420.00,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(3),
      medioDePago: 'Tarjeta',
    ),
    Movimiento(
      id: '6',
      titulo: 'Almuerzo de oficina',
      categoria: CategoriaMovimiento.superYComida,
      monto: 250.00,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(4),
      medioDePago: 'Efectivo',
    ),
    Movimiento(
      id: '7',
      titulo: 'Internet',
      categoria: CategoriaMovimiento.servicios,
      monto: 400.00,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(6),
      medioDePago: 'Banco',
    ),
    Movimiento(
      id: '8',
      titulo: 'Farmacia',
      categoria: CategoriaMovimiento.salud,
      monto: 1000.00,
      tipo: TipoMovimiento.gasto,
      fecha: _hace(7),
      medioDePago: 'Efectivo',
    ),
  ];

  @override
  Future<List<Movimiento>> obtenerMovimientos() async {
    final ordenados = [..._movimientos]..sort((a, b) => b.fecha.compareTo(a.fecha));
    return ordenados;
  }

  @override
  Future<List<Movimiento>> obtenerUltimos({int limite = 3}) async {
    final ordenados = await obtenerMovimientos();
    return ordenados.take(limite).toList();
  }

  @override
  Future<Presupuesto> obtenerPresupuesto(DateTime mes) async {
    return Presupuesto(
      mes: DateTime(mes.year, mes.month),
      montoMensual: 6500.00,
      saldoEnCuentas: 1989.13,
      metasActivas: 4,
    );
  }
}
