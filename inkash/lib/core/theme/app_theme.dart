import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Tema unico de la aplicacion. Se arma una sola vez y se inyecta en el
/// [MaterialApp] desde `app.dart`.
abstract final class AppTheme {
  static ThemeData get oscuro {
    final base = ThemeData(brightness: Brightness.dark, useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.fondo,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.lima,
        surface: AppColors.superficie,
        onSurface: AppColors.texto,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.progresoFondo,
        thickness: 0.5,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.lima,
        linearTrackColor: AppColors.progresoFondo,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.lima,
        textColor: AppColors.texto,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.superficieNav,
        selectedItemColor: AppColors.lima,
        unselectedItemColor: AppColors.textoSuave,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.texto,
        displayColor: AppColors.texto,
      ),
    );
  }
}
