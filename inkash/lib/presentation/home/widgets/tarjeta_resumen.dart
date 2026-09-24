import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// Tarjeta pequena de la fila superior: "Cuentas", "Metas de ahorro".
///
/// Antes era la funcion `tarjetaHero`. Como widget, Flutter puede reconstruir
/// solo esta parte del arbol en vez de todo lo que la rodea.
class TarjetaResumen extends StatelessWidget {
  const TarjetaResumen({
    required this.titulo,
    required this.valor,
    super.key,
  });

  final String titulo;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.superficie,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo.toUpperCase(),
            style: const TextStyle(fontSize: 10, color: AppColors.textoSuave),
          ),
          const SizedBox(height: 6),
          Text(
            valor,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
