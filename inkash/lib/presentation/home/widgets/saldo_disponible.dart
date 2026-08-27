import 'package:flutter/material.dart';

import '../../../core/domain/resumen_inicio.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';

/// Bloque principal de Inicio: saldo grande y avance del presupuesto.
///
/// No calcula nada: todos los numeros ya vienen resueltos en [ResumenInicio].
class SaldoDisponible extends StatelessWidget {
  const SaldoDisponible({required this.resumen, super.key});

  final ResumenInicio resumen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TE QUEDAN DISPONIBLES',
          style: TextStyle(fontSize: 11, color: AppColors.lima),
        ),
        const SizedBox(height: 6),
        Text(
          Moneda.q(resumen.saldoDisponible),
          style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: resumen.avanceDelPresupuesto,
          color: resumen.presupuestoExcedido ? Colors.redAccent : AppColors.lima,
          backgroundColor: AppColors.progresoFondo,
        ),
        const SizedBox(height: 7),
        Text(
          'Has usado ${Moneda.q(resumen.gastadoEnElMes)} '
          'de ${Moneda.q(resumen.presupuestoMensual)}',
          style: const TextStyle(fontSize: 12, color: AppColors.textoSuave),
        ),
      ],
    );
  }
}
