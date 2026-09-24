import 'package:flutter/material.dart';

import '../../../core/domain/movimiento.dart';
import '../../../core/theme/app_colors.dart';
import 'fila_movimiento.dart';

/// Seccion "Ultimos movimientos": encabezado + lista separada por divisores.
class SeccionMovimientos extends StatelessWidget {
  const SeccionMovimientos({required this.movimientos, super.key});

  final List<Movimiento> movimientos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Ultimos movimientos', style: TextStyle(fontSize: 16)),
            Text('Ver todos', style: TextStyle(fontSize: 12, color: AppColors.lima)),
          ],
        ),
        if (movimientos.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Todavia no hay movimientos registrados.',
              style: TextStyle(color: AppColors.textoSuave),
            ),
          )
        else
          for (final (indice, movimiento) in movimientos.indexed) ...[
            if (indice > 0) const Divider(height: 0),
            FilaMovimiento(movimiento: movimiento),
          ],
      ],
    );
  }
}
