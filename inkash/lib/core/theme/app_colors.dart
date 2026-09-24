import 'package:flutter/material.dart';

/// Paleta de Inkash. Ningun color literal deberia vivir fuera de este archivo:
/// si manana cambia la marca, se cambia aqui y no en cada pantalla.
abstract final class AppColors {
  /// Color de acento: ingresos, iconos activos y barra de progreso.
  static const Color lima = Colors.lime;

  /// Fondo general de la app.
  static const Color fondo = Color(0xFF262524);

  /// Fondo de las tarjetas (Cuentas, Metas de ahorro).
  static const Color superficie = Color(0xFF2A2926);

  /// Fondo de la barra de navegacion inferior.
  static const Color superficieNav = Color(0xFF2F2C2C);

  /// Texto principal sobre fondo oscuro.
  static const Color texto = Color(0xFFF5F4F1);

  /// Texto secundario: categorias, fechas, montos de gasto.
  static const Color textoSuave = Color(0xFFE2E1DC);

  /// Canal vacio de la barra de progreso del presupuesto.
  static const Color progresoFondo = Color(0xFF555555);
}
