import 'package:intl/intl.dart';

/// Formato de moneda guatemalteca: `Q1,989.13`.
abstract final class Moneda {
  // Se declara el patron explicito (miles con coma, dos decimales) en lugar de
  // depender de un locale: asi el formato es el mismo en cualquier dispositivo.
  static final NumberFormat _formato = NumberFormat('#,##0.00', 'en_US');

  /// `Q1,989.13`
  static String q(double monto) => 'Q${_formato.format(monto)}';

  /// `+ Q1,200.00` para ingresos, `- Q48.00` para gastos.
  static String conSigno(double monto, {required bool esIngreso}) =>
      '${esIngreso ? '+' : '-'} ${q(monto.abs())}';
}

/// Fechas escritas como las leeria el usuario, en espanol y sin depender de
/// la inicializacion de locales de `intl`.
abstract final class Fechas {
  static const List<String> _meses = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
  ];

  /// `Agosto 2026`
  static String mesYAnio(DateTime fecha) => '${_meses[fecha.month - 1]} ${fecha.year}';

  /// `Hoy`, `Ayer` o `12 ago` para fechas mas viejas.
  static String relativa(DateTime fecha) {
    final hoy = _soloDia(DateTime.now());
    final dias = hoy.difference(_soloDia(fecha)).inDays;

    return switch (dias) {
      0 => 'Hoy',
      1 => 'Ayer',
      _ => '${fecha.day} ${_meses[fecha.month - 1].substring(0, 3).toLowerCase()}',
    };
  }

  static DateTime _soloDia(DateTime f) => DateTime(f.year, f.month, f.day);
}
