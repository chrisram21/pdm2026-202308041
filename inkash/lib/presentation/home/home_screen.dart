import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/resumen_inicio.dart';
import '../../core/repository/providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/formatters.dart';
import 'widgets/saldo_disponible.dart';
import 'widgets/seccion_movimientos.dart';
import 'widgets/tarjeta_resumen.dart';

/// Pantalla de Inicio.
///
/// Es un [ConsumerWidget]: solo observa providers y pinta. No sabe si los datos
/// vienen de memoria, de sqflite o de una API.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumen = ref.watch(resumenInicioProvider);
    final movimientos = ref.watch(ultimosMovimientosProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Hola, Animal'),
                Text(
                  Fechas.mesYAnio(DateTime.now()),
                  style: const TextStyle(color: AppColors.textoSuave),
                ),
              ],
            ),
            const SizedBox(height: 22),
            switch (resumen) {
              AsyncData(:final value) => _BloqueResumen(resumen: value),
              AsyncError() => const _Aviso('No se pudo cargar tu resumen.'),
              _ => const _Cargando(alto: 180),
            },
            const SizedBox(height: 20),
            switch (movimientos) {
              AsyncData(:final value) => SeccionMovimientos(movimientos: value),
              AsyncError() => const _Aviso('No se pudieron cargar tus movimientos.'),
              _ => const _Cargando(alto: 160),
            },
          ],
        ),
      ),
      bottomNavigationBar: const _BarraNavegacion(),
    );
  }
}

/// Saldo grande + las dos tarjetas de la fila superior.
class _BloqueResumen extends StatelessWidget {
  const _BloqueResumen({required this.resumen});

  final ResumenInicio resumen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SaldoDisponible(resumen: resumen),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TarjetaResumen(
                titulo: 'Cuentas',
                valor: Moneda.q(resumen.saldoDisponible),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TarjetaResumen(
                titulo: 'Metas de ahorro',
                valor: '${resumen.metasActivas} activas',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Cargando extends StatelessWidget {
  const _Cargando({required this.alto});

  final double alto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: alto,
      child: const Center(child: CircularProgressIndicator(color: AppColors.lima)),
    );
  }
}

class _Aviso extends StatelessWidget {
  const _Aviso(this.mensaje);

  final String mensaje;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(mensaje, style: const TextStyle(color: AppColors.textoSuave)),
    );
  }
}

/// Barra inferior. Por ahora solo Inicio esta disenada, asi que las demas
/// pestanas quedan visibles pero sin navegacion.
class _BarraNavegacion extends StatelessWidget {
  const _BarraNavegacion();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Cuentas'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Tarjetas'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}
