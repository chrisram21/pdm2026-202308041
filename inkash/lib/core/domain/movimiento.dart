// Capa de dominio: Dart puro. Este archivo NO debe importar flutter/material
// ni sqflite. Si algun dia se cambia la base de datos o la UI, esto no cambia.

/// Si el movimiento suma o resta al saldo.
enum TipoMovimiento { ingreso, gasto }

/// Categoria a la que pertenece un movimiento.
///
/// Guarda la etiqueta que se muestra al usuario, pero no el icono: el icono es
/// un `IconData` de Flutter y por lo tanto pertenece a la capa de presentacion.
enum CategoriaMovimiento {
  transporte('Transporte'),
  superYComida('Super y comida'),
  servicios('Servicios'),
  salud('Salud'),
  ingreso('Ingreso'),
  otros('Otros');

  const CategoriaMovimiento(this.etiqueta);

  final String etiqueta;
}

/// Un ingreso o gasto registrado por el usuario.
class Movimiento {
  const Movimiento({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.monto,
    required this.tipo,
    required this.fecha,
    this.medioDePago,
  }) : assert(monto >= 0, 'El monto se guarda en positivo; el signo lo da el tipo');

  final String id;

  /// Descripcion corta: "Super La Torre".
  final String titulo;

  final CategoriaMovimiento categoria;

  /// Siempre positivo. Que sume o reste lo decide [tipo].
  final double monto;

  final TipoMovimiento tipo;

  final DateTime fecha;

  /// De donde salio o entro el dinero: "Tarjeta", "Banco", "Efectivo".
  final String? medioDePago;

  bool get esIngreso => tipo == TipoMovimiento.ingreso;

  /// Monto con signo, para sumarlo directamente a un saldo.
  double get montoConSigno => esIngreso ? monto : -monto;

  /// Texto secundario de la fila: "Super y comida - Tarjeta".
  String get descripcion =>
      medioDePago == null ? categoria.etiqueta : '${categoria.etiqueta} - $medioDePago';
}
