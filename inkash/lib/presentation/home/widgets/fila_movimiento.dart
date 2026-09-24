import 'package:flutter/material.dart';

import '../../../core/domain/movimiento.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';

/// Una fila de la lista de ultimos movimientos.
///
/// Recibe la entidad de dominio y decide como se ve: el icono no vive en el
/// dominio porque `IconData` es de Flutter.
class FilaMovimiento extends StatelessWidget {
  const FilaMovimiento({required this.movimiento, super.key});

  final Movimiento movimiento;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(_iconoDe(movimiento.categoria), color: AppColors.lima),
      title: Text(movimiento.titulo),
      subtitle: Text(
        movimiento.descripcion,
        style: const TextStyle(color: AppColors.textoSuave, fontSize: 12),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            Moneda.conSigno(movimiento.monto, esIngreso: movimiento.esIngreso),
            style: TextStyle(
              color: movimiento.esIngreso ? AppColors.lima : AppColors.textoSuave,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            Fechas.relativa(movimiento.fecha),
            style: const TextStyle(color: AppColors.textoSuave, fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// Traduccion categoria de dominio -> icono de Material.
  static IconData _iconoDe(CategoriaMovimiento categoria) => switch (categoria) {
        CategoriaMovimiento.transporte => Icons.directions_bus_filled,
        CategoriaMovimiento.superYComida => Icons.shopping_cart,
        CategoriaMovimiento.servicios => Icons.receipt_long,
        CategoriaMovimiento.salud => Icons.local_hospital,
        CategoriaMovimiento.ingreso => Icons.arrow_upward,
        CategoriaMovimiento.otros => Icons.category,
      };
}
